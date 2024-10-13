//
// Models.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/20/24
//

//Importing libraries necessary for location mangement, and data handling.

import Foundation
import FirebaseFirestoreSwift
import CoreLocation

//Data development behind a regular question's structure.

struct Question: Identifiable, Codable {
    @DocumentID var id: String? // This is an optional ID from Firebase Firestore
    var textPrompt: String
    var type: QuestionType
}

//Classifying the different types of questions present in the app early on for easier accessibility.

enum QuestionType: String, Codable {
    case yesNo
    case typed
}

//Classifying the two components of a question [the prompt & the answer] for scope usage in later files.

struct Response: Identifiable, Codable {
    @DocumentID var id: String? // This is an optional ID from Firebase Firestore
    var question: Question
    var answer: String
    var userId: String
}

//Firebase linkage, categorizing different attributes of an account for future verification such as location, admin qualifications, etc.

struct User: Identifiable, Codable {
    @DocumentID var id: String? 
    var email: String
    var isAdmin: Bool
    var location: GeoPoint? 
}
