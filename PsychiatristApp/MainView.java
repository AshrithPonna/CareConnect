//
// MainView.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/19/24
// 

//Importation of crucial Swift library.

import SwiftUI

//Setting up user/patient view.

struct MainView: View {
    @State private var isUserAuthenticated = false
    @State private var isAdmin = false
    @StateObject private var quizManager = QuizManager()
   
    //Checking for psychiatric credentials for potential view change.
    
    var body: some View {
        if isUserAuthenticated {
            if isAdmin {
                AdminView()
                    .environmentObject(quizManager)
            } else {
                TabView {
                    ContentView()
                        .environmentObject(quizManager)
                        .tabItem {
                            Label("Quiz", systemImage: "list.bullet")
                        }
                    
                    //Setting up view for chatbot, in perspective of users.
                    
                    ChatbotView()
                        .tabItem {
                            Label("Chatbot", systemImage: "message")
                        }
                }
            }
        } else {
            LoginView()
                .environmentObject(quizManager)
        }
    }
}


