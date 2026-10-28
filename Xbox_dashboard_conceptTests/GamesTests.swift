//
//  GamesTests.swift
//  Xbox_dashboard_conceptTests
//
//  Created by Codex on 28/10/2026.
//

import Testing
@testable import Xbox_dashboard_concept

struct GamesTests {
    @MainActor
    @Test func loadGamesSetsModel() async throws {
        let presenter = GamesPresenter(service: MockGamesService())
        await presenter.action(.load)
        #expect(presenter.model.games.count == 2)
        #expect(presenter.model.focusedGame?.name == "Test 1")
        #expect(presenter.model.launchGame == false)
    }

    @MainActor
    @Test func selectGameUpdatesFocused() async throws {
        let presenter = GamesPresenter(service: MockGamesService())
        await presenter.action(.load)
        let game = GameObject(uniqueID: 99, name: "Other", image: "img", slug: .WayOut)
        await presenter.action(.select(game: game))
        #expect(presenter.model.focusedGame?.uniqueID == 99)
    }

    @MainActor
    @Test func launchGameUpdatesState() async throws {
        let presenter = GamesPresenter(service: MockGamesService())
        await presenter.action(.launch)
        #expect(presenter.model.launchGame == true)
        await presenter.action(.stopLaunch)
        #expect(presenter.model.launchGame == false)
    }
}

struct MockGamesService: GamesServiceProtocol {
    func fetchGames() async -> [GameObject] {
        return [
            GameObject(uniqueID: 1, name: "Test 1", image: "ic-1", slug: .WayOut),
            GameObject(uniqueID: 2, name: "Test 2", image: "ic-2", slug: .F22)
        ]
    }
}
