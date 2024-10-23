//
// ChatbotView.swift
// PsychProj
//
// Created by Ashrith Ponna on 10/17/24
//

//Importing crucial library for swift functionality.

import SwiftUI

//Setting up basic structure of chatbot view.

struct ChatbotView: View {
    @ObservedObject var chatbotManager = ChatbotManager()
    @State private var currentMessage: String = ""
    
    //Main visuality behind user's perception of chatbot screen.
    
    var body: some View {
        VStack {
            List(chatbotManager.messages) { message in
                HStack {
                    if message.role == .bot {
                        Spacer()
                        Text(message.content)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    } else {
                        Text(message.content)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        Spacer()
                    }
                }
            }
            .padding()
            
            //Customizing input prompt for user to AI.
            
            HStack {
                TextField("Type your message here...", text: $currentMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                //Data entry customization.
                
                Button("Send") {
                    chatbotManager.sendMessage(currentMessage)
                    currentMessage = ""
                }
                .padding()
            }
        }
        .navigationTitle("Psychiatry Chatbot")
    }
}

