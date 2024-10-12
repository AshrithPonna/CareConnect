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
                ZStack(alignment: .topLeading){
                    MainTabView()
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
