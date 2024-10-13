//
// LoginView.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/23/24
//

//Library imports for data storage and basic functionality.

import SwiftUI
import Firebase

//Setting up login visualities for the user of the app.

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isUserAuthenticated = false
    @State private var isAdmin = false
    @EnvironmentObject var quizManager: QuizManager
    
    //Visual structure of login system on the basis of credential entry.
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                login()
            }) {
                Text("Login")
            }
        }
    }
    
    //Algorithm behind login interface, checking inputted credentials via data in Firebase.
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                checkIfAdmin(user: user)
                isUserAuthenticated = true
                quizManager.fetchQuestions()
            } else {
                print("Error logging in: \(error?.localizedDescription ?? "")")
            }
