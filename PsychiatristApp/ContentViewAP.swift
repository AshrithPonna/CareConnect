//
// ContentView.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/20/24
//

//Importing libraries to initialize Firebase, and to initialize the basic structure of the app.

//MERGE WITH QVIEW?

import SwiftUI
import Firebase

// Setting up the quiz infrastructural view for the patient.

struct ContentView: View {
    @ObservedObject var quizManager = QuizManager()
    @State private var currentUserID: String = Auth.auth().currentUser?.uid ?? ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(quizManager.questions) { question
                }
            }
        }
    }
}

#Preview {
    NavigationView{
        ContentViewAP()
    }
}
