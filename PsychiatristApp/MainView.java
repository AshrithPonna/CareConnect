//
// MainView.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/19/24
// 

//Importation of crucial Swift library.

import SwiftUI

//Setting up main view of app for users/admins to see.

struct MainView: View {
    @State private var isUserAuthenticated = false
    @State private var isAdmin = false
    @StateObject private var quizManager = QuizManager()
    
    //Changing views based on admin/user credentiality.
    
    var body: some View {
        if isUserAuthenticated {
            if isAdmin {
                AdminView()
                    .environmentObject(quizManager)
            } else {
                ContentView()
                    .environmentObject(quizManager)
            }
        } else {
            LoginView()
                .environmentObject(quizManager)
        }
    }
}

