//
//  Coordinator.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import Foundation

protocol Coordinator: ObservableObject where Screen: Routable {
    associatedtype Screen
    var navigationPath: [Screen] { get }
}
