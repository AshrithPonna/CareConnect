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
            
            //TODO: add more player info like age and level
            
            Spacer()
        }
    }
}

#Preview {
    NavigationView{
        ProfileView(user: User(id: NSUUID().uuidString, email: "anshkool@icloud.com", fullname: "Ansh Gupta", profileImageUrl: "", username: "anshtheplayer"))
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
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth:0.75))
            
            
            NavigationLink(destination: {
                if(viewModel.actionButtontitle == "Edit Profile"){
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
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text("Best Tennis Player")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack{
                Image(systemName: "tennisball")
                
                Text("www.usta.com")
            }
            .font(.footnote)
            .foregroundColor(.gray)
            
        }
        .padding(.horizontal)
    }
}
