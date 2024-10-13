//
// AppDelegate.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/21/24
//

//Importing libraries to initialize Firebase.

import UIKit
import Firebase

//Delegating Firebase controls, and cross applying library to app focus.

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


