//
//  LocalTennisAppApp.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 7/17/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

@main
struct LocalTennisAppApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    
            }
            .environmentObject(viewModel)
        }
    }
}
