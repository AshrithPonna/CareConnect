//
// ChatbotManager.swift
// PsychProj
//
// Created by Ashrith Ponna on 10/19/24
//

//Importing crucial libraries for data management and AI. corroboration.

import SwiftUI
import OpenAI 

//Setting up user-to-AI digital environment.

class ChatbotManager: ObservableObject {
    @Published var messages: [ChatMessage] = []
    private var openAI: OpenAI
    
    //Verification for OPENAI connection needed via API Key.
    
    init() {
        self.openAI = OpenAI(apiKey: "your-openai-api-key")
    }
    
    //Formulation of question by user to allow registry from AI.
    
    func sendMessage(_ message: String) {
        let userMessage = ChatMessage(role: .user, content: message)
        messages.append(userMessage)
        
        //Allowing AI to formulate a response back to the user based on prompt.
        
        openAI.completions.create(prompt: message, maxTokens: 150) { result in
            switch result {
            case .success(let response):
                if let aiMessage = response.choices.first?.text {
                    let botMessage = ChatMessage(role: .bot, content: aiMessage)
                    DispatchQueue.main.async {
                        self.messages.append(botMessage)
                    }
                }
            case .failure(let error):
                print("Error generating response: \(error)")
            }
        }
    }
}

//Initializing main components of AI/User chat entries/responses.

struct ChatMessage: Identifiable {
    let id = UUID()
    let role: ChatRole
    let content: String
}

//Simple role initializer.

enum ChatRole {
    case user
    case bot
}

