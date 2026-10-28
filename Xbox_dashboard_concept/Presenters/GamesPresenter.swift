//
//  GamesPresenter.swift
//  Xbox_dashboard_concept
//
//  Created by Codex on 28/10/2026.
//

import Foundation

@MainActor
final class GamesPresenter {
    let model = GamesModel()
    private let service: GamesServiceProtocol

    enum Action {
        case load
        case select(game: GameObject)
        case launch
        case stopLaunch
    }

    init(service: GamesServiceProtocol = GamesService()) {
        self.service = service
    }

    func action(_ action: Action) async {
        switch action {
        case .load:
            let games = await service.fetchGames()
            model.games = games
            if model.focusedGame == nil {
                model.focusedGame = games.first
            }
            model.launchGame = false
        case .select(let game):
            model.focusedGame = game
        case .launch:
            model.launchGame = true
        case .stopLaunch:
            model.launchGame = false
        }
    }
}
