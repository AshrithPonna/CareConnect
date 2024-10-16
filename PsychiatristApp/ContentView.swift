//
//  ContentView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 7/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            //no user is logged in
            if viewModel.userSession == nil {
                LoginView()
            } else{
                if let user = viewModel.currentUser {
                                    MainTabView(user: user)
                } else {
                    // Handle case where user is not available (e.g., loading state)
                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("Logout")
                        
                    }
                }

            }
        }
    }
}

#Preview {
    NavigationView{
        ContentView()
    }
}
