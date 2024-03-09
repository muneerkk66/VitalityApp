//
//  DomainMapper.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation
protocol DomainMapper {
    associatedtype EntityType
    func toDomain() -> EntityType
}
