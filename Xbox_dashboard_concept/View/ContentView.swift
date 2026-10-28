//
//  ContentView.swift
//  Xbox_dashboard_concept
//
//  Created by Pablo Benzo on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var buttonSelected = ""

    var body: some View {
        VStack {
            Text("Button Pressed \(buttonSelected)")
                .font(.title)
                .bold()
                .padding(20)

            Button {
                buttonSelected = "Login"
            } label: {
                Text("Login")
            }
            
            Button {
                buttonSelected = "Register"
            } label: {
                Text("Register")
            }
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
