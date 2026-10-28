//
//  TableView.swift
//  Xbox_dashboard_concept
//
//  Created by Pablo Benzo on 11/03/2025.
//

import SwiftUI

struct TableView: View {
    
    @State var backgroundImage: String?
    
    var body: some View {
        ZStack {
            Image(backgroundImage ?? "ic-game-bg")
                .resizable()
                .opacity(0.5)

            TabView {
                GamesMainView()
                    .tabItem {
                        Label("Games", systemImage: "gamecontroller.fill")
                    }
                    .onAppear {
                        backgroundImage = "ic-game-bg"
                    }
                MediaView()
                    .tabItem {
                        Label("Media", systemImage: "photo.artframe")
                    }
                    .onAppear {
                        backgroundImage = "ic-media-bg"
                    }
                StoreView()
                    .tabItem {
                        Label("Store", systemImage: "cart.fill")
                    }
                    .onAppear {
                        backgroundImage = "ic-Xbox-store"
                    }
            }
        }
        .ignoresSafeArea()
    }
}

struct GamesMainView: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct MediaView: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct StoreView: View {
    var body: some View {
        VStack {
            
        }
    }
}
