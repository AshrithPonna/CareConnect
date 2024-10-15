//
//  HomePage.swift
//  PsychiatristApp
//
//  Created by Ansh Gupta on 10/14/24.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        
        VStack {
            Button {
                authViewModel.signOut()
            } label: {
                Text("Logout")
            }
            
            
            if let user = authViewModel.currentUser{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    HomePage()
}
