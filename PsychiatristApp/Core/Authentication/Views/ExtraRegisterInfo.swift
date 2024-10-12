//
//  ExtraResgisterInfo.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/10/24.
//
import SwiftUI
struct ExtraRegisterInfo: View {
    @State private var birthday = Date()
    @State private var gender = ""
    @State private var level = ""
    var genders = ["Gender", "Male", "Female", "Other"]
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var isProfilePhotoSelecterActive = false
    
    var body: some View {
        NavigationStack{
            
            VStack{
                NavigationLink(value: "ProfilePhotoSelecter") {
                    EmptyView()
                }
                
                AuthenticationHeaderView(title1: "Setup Account", title2: "Additional Information")
                
                Text("Please select your psychiarist")
                
                HStack{
                    Button {
                        level = "sigmundfreud"
                    } label: {
                        VStack{
                            
                            Text("Dr. Sigmund Freud")
                                .fontWeight(.bold)
                                .font(.headline)
                        
                        }
                        .frame(width:175, height: 50)
                        .foregroundColor(.white)
                        .background(Color(level == "sigmundfreud" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                    Button {
                        level = "carljung"
                    } label: {
                        VStack{
                            
                            Text("Dr. Carl Jung")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                        }
                        .frame(width:175, height: 50)
                        .foregroundColor(.white)
                        .background(Color(level == "carljung" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                }
                HStack{
                    Button {
                        level = "emilkraepelin"
                    } label: {
                        VStack{
                            
                            Text("Dr. Emil Kraepelin")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                    
                        }
                        .frame(width:175, height: 50)
                        .foregroundColor(.white)
                        .background(Color(level == "emilkraepelin" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                    Button {
                        level = "aaronbeck"
                    } label: {
                        VStack{
                            
                            Text("Dr. Aaron Beck")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                        
                        }
                        .frame(width:175, height: 50)
                        .foregroundColor(.white)
                        .background(Color(level == "aaronbeck" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                    
                    
                }
                .padding()
                
                Divider()
                    .background(Color(.darkGray))
                    .padding(.horizontal, 32)
                
                HStack{
                    
                    Image(systemName: "birthday.cake")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(.darkGray))
                    
                    DatePicker("Birthday", selection: $birthday, in: ...Date(), displayedComponents: .date)
                        .padding()
                }
                .padding(.horizontal, 32)
                
                
                Divider()
                    .background(Color(.darkGray))
                    .padding(.horizontal, 32)
                    .padding(.top, 12)
                
                HStack{
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(.darkGray))
                    
                    Text("Gender")
                    
                    Picker("genders", selection: $gender) {
                        ForEach(genders, id: \.self) { gender in
                            Text(gender)
                        }
                    }
                }
                .padding()

                
                Button {
                    viewModel.uploadAdditionalData(birthday, level: level, gender: gender)
                    isProfilePhotoSelecterActive = true
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                
                
                Spacer()
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $isProfilePhotoSelecterActive) {
                ProfilePhotoSelecterView()
            }
        }
    }
}
#Preview {
    ExtraRegisterInfo()
}
