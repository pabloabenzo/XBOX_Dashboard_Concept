//
//  Model.swift
//  Xbox_dashboard_concept
//
//  Created by Pablo Benzo on 11/03/2025.
//

import Foundation

@MainActor
final class GamesModel {
    var games: [GameObject] = []
    var focusedGame: GameObject?
    var launchGame: Bool = false
}
