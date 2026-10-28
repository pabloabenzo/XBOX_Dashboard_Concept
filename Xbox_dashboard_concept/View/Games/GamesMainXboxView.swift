//
//  GamesMainXboxView.swift
//  Xbox_dashboard_concept
//
//  Created by Pablo Benzo on 11/03/2025.
//

import SwiftUI

struct GamesMainXboxView: View {
    @State var presenter = GamesPresenter()
    @FocusState var focusedField: GameObject?
    @Binding var launchGame: Bool

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(presenter.model.games, id: \.uniqueID) { game in
                        Button {
                            Task {
                                await presenter.action(.launch)
                            }
                        } label: {
                            Image(game.image)
                                .resizable()
                                .frame(width: 270, height: 270)
                        }
                        .buttonStyle(.borderless)
                        .focused($focusedField, equals: game)
                    }
                }
            }
            .frame(height: 320)

            HStack {
                VStack(alignment: .leading, spacing: 40) {
                    Text(presenter.model.focusedGame?.name ?? "-")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.title2)
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Time played")
                            Text("3h 1m")
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Progress")
                            Text("10%")
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Last Achievement")
                            HStack(spacing: 12) {
                                Image(systemName: "trophy.fill")
                                    .frame(width: 40, height: 40)

                                Text("Master Builder")
                            }
                        }
                    }
                }
                .padding(.leading, 40)
                Spacer()
            }
            .opacity(presenter.model.focusedGame != nil ? 1 : 0)
            Spacer()
        }
        .frame(height: 600)
        .task {
            await presenter.action(.load)
            if let focused = presenter.model.focusedGame {
                focusedField = focused
            }
            launchGame = presenter.model.launchGame
        }
        .onChange(of: focusedField) { _, newValue in
            if let newValue {
                Task {
                    await presenter.action(.select(game: newValue))
                }
            }
        }
        .onChange(of: presenter.model.launchGame) { _, newValue in
            launchGame = newValue
        }
    }
}

