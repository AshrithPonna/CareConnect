//
//  TweetRowView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 7/17/24.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text("Roger Federer")
                            .font(.subheadline).bold()
                        
                        Text("@rogerfederer")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("1d")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text("I want to practice some tennis at McGraw later today")
                        .font(.subheadline)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }
            }
            
            HStack{
                Button {
                    // action can go here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action can go here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action can go here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action can go here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

#Preview {
    TweetRowView()
}
