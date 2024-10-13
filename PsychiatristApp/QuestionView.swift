//
// QuestionView.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/20/24
//

import SwiftUI

//Setting up the quiz infrastructural view for the patient.

struct QuestionView: View {
    @ObservedObject var quizManager = QuizManager() 
    
    //Setting up the visual format [outer structure] of soon-to-be presented questions.
    
    var body: some View {
        NavigationView {
            List {
                ForEach(quizManager.questions, id: \.textPrompt) { question in
                    NavigationLink(destination: QuestionView(question: question, quizManager: quizManager)) {
                        Text(question.textPrompt)
                    }
                }
            }
            .navigationTitle("Quiz")
        }
    }
}

//Setting up question format for the patient/user [outer & inner].

struct QuestionView: View {
    var question: Question
    @ObservedObject var quizManager: QuizManager
    @State private var answer: String = ""
    
    var body: some View {
        VStack {
            Text(question.textPrompt)
                .font(.headline)
                .padding()
            
            //Initializing response feedback for yes/no type questions, in perspective of users.
            
            if question.type == .yesNo {
                Picker("Answer", selection: $answer) {
                    Text("Yes").tag("Yes")
                    Text("No").tag("No")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            } else {
                
                //Initializing response feedback for written type questions, in perspective of users.
                
                TextField("Please provide your response here.", text: $answer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            //Submission/Confirmation button for users to save their responses.
            
            Button("Continue") {
                quizManager.submitResponse(for: question, answer: answer)
            }
            
            //Cleaning up site visualities
            
        .padding()
        }
        .navigationTitle("Answer Prompt")
    }
}
