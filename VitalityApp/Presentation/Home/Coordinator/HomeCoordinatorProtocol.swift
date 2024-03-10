//
//  HomeCoordinatorProtocol.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import Combine

import Foundation

@MainActor
protocol HomeCoordinatorProtocol {
    func showDetailView(name: String)
}
