//
//  DashboardView.swift
//  Xbox_dashboard_concept
//
//  Created by Pablo Benzo on 11/03/2025.
//

import SwiftUI

struct DashboardView: View {
    
    @State var backgroundImage: String?
    @State var launchGame = false
    
    var body: some View {
        ZStack {
            Image(backgroundImage ?? "ic-game-bg")
                .resizable()
                .opacity(0.5)

            NavigationView {
                VStack (alignment: .leading, spacing: 0) {
                    
                    HStack (spacing: 30) {
                        Image("ic-profile")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cliXboxhape(Circle())
                        VStack (alignment: .leading){
                            Text("abdulkarimkhaan")
                            HStack (spacing: 15) {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                Image(systemName: "plus.viewfinder")
                                    .foregroundStyle(.blue)
                            }
                        }
                        Spacer()
                        HStack (spacing: 15) {
                            Image(systemName: "wifi")
                            Text("11:35 PM")
                        }
                    }
                    
                    TabView {
                        GamesMainXboxView(launchGame: $launchGame)
                            .tabItem {
                                Label("Games", systemImage: "gamecontroller.fill")
                            }
                            .onAppear {
                                backgroundImage = "ic-game-bg"
                            }
                        MediaXboxView()
                            .tabItem {
                                Label("Media", systemImage: "photo.artframe")
                            }
                            .onAppear {
                                backgroundImage = "ic-media-bg"
                            }
                        StoreXboxView()
                            .tabItem {
                                Label("Store", systemImage: "cart.fill")
                            }
                            .onAppear {
                                backgroundImage = "ic-Xbox-store"
                            }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DashboardView()
}
