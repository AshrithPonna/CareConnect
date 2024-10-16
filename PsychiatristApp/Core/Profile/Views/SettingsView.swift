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
