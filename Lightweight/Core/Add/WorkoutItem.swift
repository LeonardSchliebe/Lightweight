//
//  WorkoutItem.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 08.12.23.
//

import Foundation

struct WorkoutItem: Codable, Identifiable{
    let id: String
    let date: TimeInterval
    let name: String
}
