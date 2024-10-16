//
//  User.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/9/24.
//

import FirebaseFirestore
import SwiftUI
import Firebase
import FirebaseAuth

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let email: String
    let fullname: String
    let profileImageUrl: String
    let username: String
    let role: String
    let age: Int
    let gender: String
    
    var isCurrentUser: Bool {return Auth.auth().currentUser?.uid == id}
}
