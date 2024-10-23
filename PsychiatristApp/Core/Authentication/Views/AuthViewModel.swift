//
//  AuthViewModel.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/6/24.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
 
class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    @Published var responsesArray: [[String]] = []
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
    }
    
    func appendResponses(array: [String]){
        responsesArray.append(array)
    }
    
    func uploadResponses() {
        guard let uid = userSession?.uid else { return }

        // Flatten the 2D array into a 1D array
        let flatResponses = responsesArray.flatMap { $0 }

        Firestore.firestore().collection("users")
            .document(uid)
            .updateData([
                "responses": flatResponses
            ]) { error in
                if let error = error {
                    print("DEBUG: Failed to upload responses with error: \(error.localizedDescription)")
                } else {
                    print("DEBUG: Responses uploaded successfully.")
                }
            }
        
        self.fetchUser()

        // Clear responses after upload
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
        }
    }
    
    //here add addition register
    func register(withEmail email:String, password: String, fullname: String, username:String){
        print("DEBUG: Register with \(email)")
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            
            self.tempUserSession = user
            
            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func uploadAdditionalData(_ birthday: Date, level: String, gender: String) {
        guard let uid = tempUserSession?.uid else { return }
        
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: Date())
        let age = ageComponents.year ?? 0
        
        Firestore.firestore().collection("users")
            .document(uid)
            .updateData([
                "birthday": birthday,
                "age": age,
                "level": level,
                "gender": gender,
                "role": "Patient",
                "responses": [""]
            ]) { error in
                self.fetchUser()
            }
    }
    
    func uploadPsychiatristAdditionalData(_ hospital: String, medicalLicenseNumber: String) {
        guard let uid = tempUserSession?.uid else { return }
        
        print("DEBUG: Trying to add psychiatrist data")
        
        Firestore.firestore().collection("users")
            .document(uid)
            .updateData([
                "hospital": hospital,
                "medicalLicenseNumber": medicalLicenseNumber,
                "gender": "0",
                "age": 0,
                "role": "Psychiatrist",
                "responses": [""]
            ]) { error in
                self.fetchUser()
            }
    }

    
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return}
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
           
        }
//        self.currentUser =  User(email: "t", fullname: "t", profileImageUrl: "t", username: "doctor1")
    }
}
