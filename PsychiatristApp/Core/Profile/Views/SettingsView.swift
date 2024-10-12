//
//  SettingsView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/7/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        Button {
            viewModel.signOut()
        } label: {
            Text("Logout")
        }

    }
}

#Preview {
    SettingsView()
}
