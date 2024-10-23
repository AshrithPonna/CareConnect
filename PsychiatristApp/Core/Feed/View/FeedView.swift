//
//  FeedView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 7/17/24.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false;
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {

        
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(QuizManager().questions, id: \.textPrompt) { question in
                        NavigationLink(destination: QuestionView(question: question, quizManager: QuizManager())) {
                            Text(question.textPrompt)
                        }
                    }
                }
                .navigationTitle("Questionnaire")
                
                Text("Please complete any number of questions that you feel are needed")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
                
                HStack {
                    Spacer() // This spacer pushes the button to the center
                    Button {
                        print("DEBUG: Button to upload was clicked")
                        viewModel.uploadResponses()
 
                    } label: {
                        Text("Submit Today's Responses")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 280, height: 40)
                            .background(Color(.systemBlue))
                            .clipShape(Capsule())
                            .padding()
                            .padding(.top, -10)
                    }
                    Spacer() // This spacer ensures the button is centered
                }
            }
        }

    }
}

#Preview {
    FeedView()
}
