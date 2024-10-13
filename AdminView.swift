//
// AdminView.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/21/24
//

//Importing crucial library for app functionality.

import SwiftUI

//Setting up visualities for admin view in relation tp user responses.

struct AdminView: View {
    @ObservedObject var quizManager = QuizManager()
    @ObservedObject var locationManager = LocationManager()
    
    //Admin guidance system to see responses sent by user.
    
    var body: some View {
        VStack {
            Text("Admin Dashboard")
                .font(.largeTitle)
                .padding()
            
            if let location = locationManager.location {
                List(quizManager.responses) { response in
                    VStack(alignment: .leading) {
                        Text("Question: \(response.question.textPrompt)")
                            .font(.headline)
                        Text("Answer: \(response.answer)")
                            .font(.subheadline)
                    }
                    .padding()
                }
            } else {
                Text("Fetching location and responses...")
                    .font(.headline)
                    .padding()
            }
        }
        .onAppear {
            locationManager.requestLocation()
        }
    }
}

