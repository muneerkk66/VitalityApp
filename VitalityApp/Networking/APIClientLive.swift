//
//  APIClient.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Combine
import Foundation
final class APIClientLive: APIClient {

    func request<T: Decodable>() -> AnyPublisher<T, APIError> {
        guard let fileURL = Bundle.main.url(forResource: AppEnvironment.development.jsonFile, withExtension: "json") else {
            return Fail(error: APIError.fileNotFound).eraseToAnyPublisher()
        }
        LogInfo("Loading Response from:\n\(fileURL)")
        return URLSession.shared.dataTaskPublisher(for: fileURL)
            .mapError { error in APIError.serverError(error)
            }
            // flatMap to ignore events while it's waiting for the current request to complete. this is mainly useful in API calls, but also useful when you load really large json file
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()

    }
}
