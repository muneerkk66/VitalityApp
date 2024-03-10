//
//  APIClient.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Combine

protocol APIClient {
    @discardableResult
    func request<T: Decodable>() -> AnyPublisher<T, APIError>
}
