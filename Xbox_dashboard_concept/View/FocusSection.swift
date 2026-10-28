//
//  FocusSection.swift
//  Xbox_dashboard_concept
//
//  Created by Pablo Benzo on 11/03/2025.
//

import SwiftUI

struct FocusSection: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("Sidemenu Pressed")
                } label: {
                    Text("Sidemenu")
                }
                Spacer()
            }
            .focusSection()
            Spacer()
            HStack {
                Spacer()
                Button {
                    print("Login Pressed")
                } label: {
                    Text("Login")
                }
                Spacer()
            }
            .focusSection()
            
            Spacer()
        }
    }
}

#Preview {
    FocusSection()
}
