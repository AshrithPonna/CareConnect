//
// QuizManager.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/20/24
//

//Importing crucial libraries for app optimization.

import SwiftUI
import Firebase

//Setting up all questions to be asked in a viable array.

class QuizManager: ObservableObject {
    @Published var questions: [Question] = [
        Question(textPrompt: "How are you feeling today? Please provide a detailed response.", type: .typed),
        Question(textPrompt: "How were you feeling this past week? Please provide a detailed response.", type: .typed),
        Question(textPrompt: "On a confidential basis, would you like one of our psychiatrists to know anything?", type: .typed),
        Question(textPrompt: "How has your environment at home been over the past week?", type: .typed),
        Question(textPrompt: "How has your environment at work been over the past week?", type: .typed),
        Question(textPrompt: "Have you felt sad, depressed, or demotivated over the past week?", type: .typed),
        Question(textPrompt: "Have you been positive, optimistic or enthralled over the past week?", type: .typed),
        Question(textPrompt: "Have you had negative thoughts (such as, but not limited to: death, or violence) this past week or today?", type: .typed),
        Question(textPrompt: "Have you had to face something negative in your life this past week or even today?", type: .typed),
        Question(textPrompt: "Have you felt a sense of hopelessness over the past week or today?", type: .typed)
    ]
    
    //Initializing an array to store user input in long-term procedural basis'.
    
    @Published var responses: [Response] = []
    
    //Attempts to retrieve questions accordingly from array above.
    
    init() {
        fetchQuestions()
    }
    
    //Sets up question module for user of the app to answer (used later).
    
    func fetchQuestions() {
        let db = Firestore.firestore()
        db.collection("questions").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching questions: \(error)")
            } else {
                self.questions = snapshot?.documents.compactMap { document in
                    try? document.data(as: Question.self)
                } ?? []
            }
        }
    }
    
    //Via the method of appending, user responses will be added on to the storing array for later use.
    
    func submitResponse(for question: Question, answer: String) {
        let response = Response(question: question, answer: answer)
        responses.append(response)
        saveResponseToFirebase(response: response)
    }
    
    //Data from response(s) given by the user is redirected to firebase server for storage.
    
    private func saveResponseToFirebase(response: Response) {
        let db = Firestore.firestore()
        do {
            let _ = try db.collection("responses").addDocument(from: response)
        } catch {
            print("Error adding response to Firestore: \(error)")
        }
    }
}
