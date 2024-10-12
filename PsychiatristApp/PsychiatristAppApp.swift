//
//  PsychiatristAppApp.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 10/12/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

// Define the AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configure Firebase when the app launches
        FirebaseApp.configure()
        return true
    }
}

@main
struct PsychiatristAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
