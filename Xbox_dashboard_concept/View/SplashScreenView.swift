//
//  SplashScreenView.swift
//  Xbox_dashboard_concept
//
//  Created by Pablo Benzo on 11/03/2025.
//

import SwiftUI

struct LaunchView: View {

    @State var showHomeScreen = false

    var body: some View {
        ZStack {
            if showHomeScreen {
                DashboardView()
            } else {
                SplashScreenView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.smooth) {
                    showHomeScreen = true
                }
            }
        }
    }
}


struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Image("ic-splash-screen")
                .resizable()
        }
        .ignoresSafeArea()
    }
}
