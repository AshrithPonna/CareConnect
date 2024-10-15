//
//  RegistrationView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/6/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var role = ""
    @State private var password = ""
    var roles = ["Patient", "Psychiatrist"]
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var isProfilePhotoSelectorActive = false
    
    @State private var isProfilePhotoSelectorActive2 = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink(value: "ProfilePhotoSelector") {
                    EmptyView()
                }
                
                AuthenticationHeaderView(title1: "Get started.", title2: "Create your account")
                
                VStack(spacing: 40) {
                    CustomInputField(imageName: "envelope", placeHolderText: "Email", text: $email)
                    
                    CustomInputField(imageName: "person", placeHolderText: "Username", text: $username)
                    
                    CustomInputField(imageName: "person", placeHolderText: "Fullname", text: $fullname)
                    
                    CustomInputField(imageName: "lock", placeHolderText: "Password", isSecureField: true, text: $password)
                    
                    HStack{
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(.darkGray))
                        
                        Text("Role")
                        
                        Picker("roles", selection: $role) {
                            ForEach(roles, id: \.self) { role in
                                Text(role)
                            }
                        }
                    }
                }
                .padding(32)
                
                Button {
                    viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
                    isProfilePhotoSelectorActive = true
                    if(role == "Psychiatrist"){
                        isProfilePhotoSelectorActive = false
                        isProfilePhotoSelectorActive2 = true
                    }
                } label: {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
                
            }
            .ignoresSafeArea()
            // Navigation destination
            .navigationDestination(isPresented: $isProfilePhotoSelectorActive) {
                ExtraRegisterInfo()
            }
            .navigationDestination(isPresented: $isProfilePhotoSelectorActive2){
                PsychiatristExtraRegister()
            }
        }
    }
}

#Preview {
    NavigationStack {
        RegistrationView()
    }
}

