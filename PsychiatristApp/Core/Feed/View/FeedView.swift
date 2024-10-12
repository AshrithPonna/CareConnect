//
//  FeedView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 7/17/24.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false;
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            ScrollView{
                LazyVStack(content: {
                    ForEach(1...20, id: \.self) { _ in
                        TweetRowView()
                            .padding()
                    }
                })
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "tennisball")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView, content: {
                NewTweetView()
            })

        }
    }
}

#Preview {
    FeedView()
}
