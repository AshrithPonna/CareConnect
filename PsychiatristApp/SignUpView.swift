//
// SignUpView.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/21/24
//

//Library imports for necessary storage viabilities.

import SwiftUI
import Firebase

//Setting up the sign-up visualities.

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isAdmin = false
    
    //Visual corroboration of the sign-up system for the user.
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Toggle(isOn: $isAdmin) {
                Text("Admin Account")
            }
            .padding()
            
            Button(action: {
                signUp()
            }) {
                Text("Sign Up")
            }
        }
    }
    
    //Algorithm under the sign-up system, allowing the user to initialize a viable account under firebase.
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).setData([
                    "email": user.email ?? "",
                    "isAdmin": isAdmin,
                    "location": GeoPoint(latitude: 0.0, longitude: 0.0)
                ]) { err in
                    if let err = err {
                        print("Error adding user: \(err)")
                    } else {
                        print("User added successfully")
                    }
                }
            } else {
                print("Error creating user: \(error?.localizedDescription ?? "")")
            }
        }
    }
}
