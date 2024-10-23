//
//  ProfileView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 7/17/24.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User){
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButtons
            
            infoDetails

            responsesList
            
            Spacer()
        }
    }
}



extension ProfileView{
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemGreen)
                .ignoresSafeArea()
            
            VStack {
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x:16, y:-4)
                }.navigationBarBackButtonHidden(true)

                
                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 71, height:72)
                .offset(x:16, y:24)
            }
        }
        .frame(height: 96)

    
    }
    
    var actionButtons: some View{
        HStack(spacing: 12){
            Spacer()
            
            NavigationLink(destination: {
                if(viewModel.actionButtontitle == "Settings"){
                    SettingsView()
                }else{
//                    MessagesView()
                }
                
            }, label: {
                Text(viewModel.actionButtontitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            })
        }
        .padding(.trailing)
        
    }
    
    
    
    var infoDetails: some View{
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                
            }
            
            Text("\(viewModel.user.role)")
                .font(.subheadline)
                .foregroundStyle(.gray)
            if(viewModel.user.role == "Patient"){
                HStack{
                    Spacer()
                    VStack{
                        Text("Age")
                            .font(.subheadline)
                        Text("\(viewModel.user.age)")
                            .font(.largeTitle)

                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Gender")
                            .font(.subheadline)

                        Text("\(viewModel.user.gender)")
                            .font(.largeTitle)
  
                        

                    }
                    

                    
                    Spacer()
                }
                .padding(.top, 30)
                
                HStack{
                    Text("Quesiton")
                        .fontWeight(.bold)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Answer")
                        .fontWeight(.bold)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.top, 40)
                .padding(.bottom, -20)
            }
            
        }
        .padding(.horizontal)
    }
    
    var responsesList: some View {
        VStack {
            ForEach(0..<viewModel.user.responses.count/2 + 1, id: \.self) { index in
                HStack {
                    if index * 2 < viewModel.user.responses.count {
                        Text(viewModel.user.responses[index * 2])
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }

                    if index * 2 + 1 < viewModel.user.responses.count {
                        Text(viewModel.user.responses[index * 2 + 1])
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                }
            }
        }
        .padding()
    }

}

#Preview {
    NavigationView{
        ProfileView(user: User(id: NSUUID().uuidString, email: "anshkool@icloud.com", fullname: "Ansh Gupta", profileImageUrl: "", username: "anshtheplayer", role: "Patient", age: 16, gender: "Male", responses: ["How was your day?", "It was good", "What are you feeling today?", "Nothing much, im feeling pretty good"]))
    }
    .environmentObject(AuthViewModel())
}
