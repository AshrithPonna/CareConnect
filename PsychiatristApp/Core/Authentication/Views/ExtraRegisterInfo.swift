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
    var genders = ["Select Gender", "Male", "Female", "Other"]
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var isProfilePhotoSelecterActive = false
    
    var body: some View {
        NavigationStack{
            
            VStack{
                NavigationLink(value: "ProfilePhotoSelecter") {
                    EmptyView()
                }
                
                AuthenticationHeaderView(title1: "Setup Account", title2: "Additional Information")
                
                Text("Select one of the following levels that fit you the best:")
                
                HStack{
                    Button {
                        level = "Beginner"
                    } label: {
                        VStack{
                            
                            Text("Beginner")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                            
                            Text("Just starting out, learning basic techniques and struggling with consistency.")
                                .font(.caption)
                        }
                        .frame(width:175, height: 100)
                        .foregroundColor(.white)
                        .background(Color(level == "Beginner" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                    Button {
                        level = "Intermediate"
                    } label: {
                        VStack{
                            
                            Text("Intermediate")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                            
                            Text("Comfortable with basic strokes and can maintain rallies with some consistency.")
                                .font(.caption)
                        }
                        .frame(width:175, height: 100)
                        .foregroundColor(.white)
                        .background(Color(level == "Intermediate" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                }
                HStack{
                    Button {
                        level = "Advanced"
                    } label: {
                        VStack{
                            
                            Text("Advanced")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                            
                            Text("Consistently strong play, regularly competes, and uses strategic game plans.")
                                .font(.caption)
                        }
                        .frame(width:175, height: 100)
                        .foregroundColor(.white)
                        .background(Color(level == "Advanced" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                    Button {
                        level = "Expert"
                    } label: {
                        VStack{
                            
                            Text("Expert")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                            
                            Text("Elite-level player with extensive competitive experience and advanced tactical skills.")
                                .font(.caption)
                        }
                        .frame(width:175, height: 100)
                        .foregroundColor(.white)
                        .background(Color(level == "Expert" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                    
                    
                }
                
                DatePicker("Birthday", selection: $birthday, in: ...Date(), displayedComponents: .date)
                
                Picker("genders", selection: $gender) {
                    ForEach(genders, id: \.self) { gender in
                        Text(gender)
                    }
                }
                
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
