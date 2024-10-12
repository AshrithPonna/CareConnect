//
//  NewTweetView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/1/24.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    print("Tweet")
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(.capsule)
                        
                }

            }
            .padding()
            
            HStack(alignment: .top){
                
                Circle()
                    .frame(width:64, height:64)
                
                TextArea(placeholder: "What is hapepning", text: $caption)
                
            }
            .padding()
        }
    }
}

#Preview {
    NewTweetView()
}
