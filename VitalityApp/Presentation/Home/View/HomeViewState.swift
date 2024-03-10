//
//  HomeViewState.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

enum HomeViewEvent {
    case onTapLeader(String)
    case retryLoadStatement
    case loadStatement
}

enum HomeViewState: Comparable {
    case idle
    case isLoading
    case finished
    case error(String)
}
