//
// QuestionView.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/20/24
//

//Importing needed library for app functionality in the long-run.

import SwiftUI

// Setting up question format for the patient/user [outer & inner].

struct QuestionView: View {
    var question: Question
    @ObservedObject var quizManager: QuizManager
    @EnvironmentObject var viewModel : AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var answer: String = ""
    
    var body: some View {
        VStack {
            Text(question.textPrompt)
                .font(.headline)
                .padding()
            
            // Initializing response feedback for yes/no type questions, in perspective of users.
            
            if question.type == .yesNo {
                Picker("Answer", selection: $answer) {
                    Text("Yes").tag("Yes")
                    Text("No").tag("No")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            } else {
                
                // Initializing response feedback for written type questions, in perspective of users.
                
                TextField("Please provide your response here.", text: $answer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            // Submission/Confirmation button for users to save their responses.
            
            Button{
                viewModel.appendResponses(array: [question.textPrompt, answer])
                
                presentationMode.wrappedValue.dismiss()
            }label: {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y:0)

        }
        .navigationTitle("Answer Prompt")
    }
}

#Preview {

    NavigationView {
        List {
            ForEach(QuizManager().questions, id: \.textPrompt) { question in
                NavigationLink(destination: QuestionView(question: question, quizManager: QuizManager())) {
                    Text(question.textPrompt)
                }
            }
        }
        .navigationTitle("Quiz")
    }

}
