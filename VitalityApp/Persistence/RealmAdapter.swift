import Foundation
import RealmSwift
import os.log

public typealias VitalityObject = Object & Decodable

/// The local caching domain a model needs to implement if it wants to be persisted
@objc public protocol CachingDomain {}

public protocol Database {
    /**
     Returns an array of the data model specified.
     - parameter type: The data models type.
     */
    func objects<T: VitalityObject>(_ type: T.Type) -> [T]
    /**
     Query to return the data model of the type, sorting by the given key and ascending parameters.
     - parameter type: The data models type.
     - parameter sortedBy: Sorts the results by the given key.
     - parameter ascending: If the results should be ascending or not.
     */
    func objects<T: VitalityObject>(_ type: T.Type, sortedBy key: String, ascending: Bool) -> [T]
    /**
     Query to return the data model of the type, with whatever matches the filter and arguments.
     - parameter type: The data models type.
     - parameter filter: Will return all objects matching the given predicate in the collection.
     - parameter args: Arguments for the above predicate string.
     */
    func objects<T: VitalityObject>(_ type: T.Type, filteredBy filter: String, _ args: Any...) -> [T]
    /**
     Query to return the data model of the type, with whatever matches the filter.
     - parameter type: The data models type.
     - parameter filter: Will return all objects matching the given predicate in the collection.
     */
    func objects<T: VitalityObject>(_ type: T.Type, filteredBy filter: NSPredicate) -> [T]
    
    /**
     Query to optionally return the first found instance of the data model type.
     - parameter type: The data models type.
     */
    func object<T: VitalityObject>(_ type: T.Type) -> T?
    /**
     Query to return the data model of the type specified by primary key.
     - parameter type: The data models type.
     - parameter primaryKey: The primary key for the object stored in the database.
     */
    func object<T: VitalityObject, KeyType>(_ type: T.Type, forPrimaryKey primaryKey: KeyType) -> T?
    /**
     Creates and runs a transaction for deletions and insertions into the database.
     - parameter deletions: The array of objects to delete in the transaction.
     - parameter insertions: The array of objects to insert in the transaction.
     */
    func update(deletions: [AnyClass], insertions: [AnyObject]) throws
    /**
     Creates and runs a transaction for deletions and insertions into the database.
     - parameter deletingSpecifically: The array of objects to delete in the transaction.
     - parameter insertions: The array of objects to insert in the transaction.
     */
    func update(deletingSpecifically: [AnyObject], insertions: [AnyObject]) throws
    /// Clears the data from the current database.
    func clearDatabase()
    /// Deletes the current database and all of its contents.
    func deleteDatabase()
}

public class RealmAdapter: Database, ObservableObject {
    public init() {
        initializeRealm()
    }

    private func initializeRealm() {
        do {
            _ = try Realm()
        } catch let error {
            os_log("Cannot create realm, attempting to delete: %@", log: .default, type: .debug, error.localizedDescription)
            // The only reason this should fail really is if we can't decrypt an existing realm because the encryption key changed.
            // Our only recourse is to delete the Realm, and retry the configuration.
            // THIS SHOULD ONLY BE DONE ON APP LAUNCH, BEFORE ANY OTHER REALM ACCESSES
            deleteDatabase()
        }
    }

    public var realm: Realm {
        return try! Realm()
    }

    public func objects<T: Object>(_ type: T.Type) -> [T] {
        return Array(realm.objects(type))
    }

    public func objects<T: Object>(_ type: T.Type, sortedBy key: String, ascending: Bool = true) -> [T] {
        return Array(realm.objects(type).sorted(byKeyPath: key, ascending: ascending))
    }

    public func objects<T: Object>(_ type: T.Type, filteredBy filter: String, _ args: Any...) -> [T] {
        return Array(realm.objects(type).filter(filter, args))
    }
    
    public func objects<T: Object>(_ type: T.Type, filteredBy filter: NSPredicate) -> [T] {
        return Array(realm.objects(type).filter(filter))
    }

    public func object<T: Object>(_ type: T.Type) -> T? {
        return objects(type).first
    }

    public func object<T: Object, KeyType>(_ type: T.Type, forPrimaryKey primaryKey: KeyType) -> T? {
        return realm.object(ofType: type, forPrimaryKey: primaryKey)
    }

    public func update(deletions: [AnyClass] = [], insertions: [AnyObject] = []) throws {
        try transaction { realm in
            let deletions = deletions.compactMap {
                $0 as? Object.Type
            }
            let insertions = insertions.compactMap {
                $0 as? Object
            }
            deletions.forEach {
                realm.delete(realm.objects($0))
            }
            realm.add(insertions)
        }
    }
    
    public func update(deletingSpecifically: [AnyObject] = [], insertions: [AnyObject] = []) throws {
        try transaction { realm in
            let insertions = insertions.compactMap {
                $0 as? Object
            }
            let deletions = deletingSpecifically.compactMap {
                $0 as? Object
            }
            realm.delete(deletions)
            realm.add(insertions)
        }
    }
    
    public func clearDatabase() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch let error {
            os_log("Error clearing the Realm: %@", log: .default, type: .debug, error.localizedDescription)
        }
    }

    public func deleteDatabase() {
        guard let realmURL = realm.configuration.fileURL else {
            return
        }

        let urls: [URL] = [realmURL,
                           realmURL.appendingPathExtension("lock"),
                           realmURL.appendingPathExtension("note"),
                           realmURL.appendingPathExtension("management")]
        urls.forEach { url in
            do {
                try FileManager.default.removeItem(at: url)
            } catch let error {
                os_log("Error deleting realm file at $@. %@", log: .default, type: .debug, url.absoluteString, error.localizedDescription)
            }
        }
    }

    private func transaction(block: ((Realm) throws -> Void)) throws {
        do {
            let realm = self.realm
            realm.beginWrite()
            do {
                try block(realm)
            } catch {
                if realm.isInWriteTransaction {
                    realm.cancelWrite()
                }
                throw error
            }
            if realm.isInWriteTransaction {
                try realm.commitWrite()
            }
        } catch let error {
            os_log("Unable to commit write transaction: %@", log: .default, type: .debug, error.localizedDescription)
            throw error
        }
    }
}


