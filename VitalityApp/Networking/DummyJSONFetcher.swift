import Foundation
import OSLog

class DummyJSONFetcher {
    static func fetchDummyJsonData(jsonFileName: String, valueOverrides: [String: String]? = nil) -> Data? {
        if let path = Bundle(for: DummyJSONFetcher.self).path(forResource: jsonFileName, ofType: "json") {
            do {
                guard let valueOverrides = valueOverrides else {
                    return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                }
                
                var fileContent = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
                for (_, pair) in valueOverrides.enumerated() {
                    fileContent = fileContent.replacingOccurrences(of: pair.key, with: pair.value)
                }
                
                return fileContent.data(using: .utf8)
            } catch let error {
                fatalError("Could not read JSON file: \(error.localizedDescription)")
            }
        } else {
            fatalError("Could not find JSON file")
        }
        return nil
    }
}

public func decodeServiceResponse<T: Decodable>(_ type: T.Type, data: Data) -> (T?, Error?) {
    do {
        let decoder = JSONDecoder()
        //decoder.dateDecodingStrategy = .multipleDateFormats
        let model = try decoder.decode(type, from: data)
        return (model, nil)
    } catch let error as DecodingError {
        switch error {
        case let .typeMismatch(type, context):
            os_log("Type mismatch. Found: %@ for key %@", log: .default, type: .debug, "\(type)", context.codingPath.map({ $0.stringValue }).joined(separator: "."))
        case let .keyNotFound(_, context):
            os_log("Key not found: %@", log: .default, type: .debug, context.codingPath.map({ $0.stringValue }).joined(separator: "."))
        case let .dataCorrupted(context):
            os_log("Data corrupted: %@ for key %@", log: .default, type: .debug, context.debugDescription, context.codingPath.map({ $0.stringValue }).joined(separator: "."))
        default: break
        }
        return (nil, error)
    } catch {
        return (nil, error)
    }
}
