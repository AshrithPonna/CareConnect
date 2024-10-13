//
//  PsychiatristExtraRegister.swift
//  PsychiatristApp
//
//  Created by Ansh Gupta on 10/12/24.
//

import SwiftUI
struct PsychiatristExtraRegister: View {

    @State private var hospital = ""
    @State private var medicalLicenseNumber = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var isProfilePhotoSelecterActive = false
    
    var body: some View {
        NavigationStack{
            
            VStack{
                NavigationLink(value: "ProfilePhotoSelecter") {
                    EmptyView()
                }
                
                AuthenticationHeaderView(title1: "Setup Account", title2: "Additional Information")
                
                Text("Hospital")
                
                HStack{
                    Button {
                        hospital = "carle"
                    } label: {
                        VStack{
                            
                            Text("Carle Foundation Hospital ")
                                .fontWeight(.bold)
                                .font(.headline)
                        
                        }
                        .frame(width:175, height: 75)
                        .foregroundColor(.white)
                        .background(Color(hospital == "carle" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                    Button {
                        hospital = "advent"
                    } label: {
                        VStack{
                            
                            Text("AdventHealth")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                        }
                        .frame(width:175, height: 75)
                        .foregroundColor(.white)
                        .background(Color(hospital == "advent" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                }
                HStack{
                    Button {
                        hospital = "hca"
                    } label: {
                        VStack{
                            
                            Text("HCA Healthcare")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                    
                        }
                        .frame(width:175, height: 75)
                        .foregroundColor(.white)
                        .background(Color(hospital == "hca" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                    Button {
                        hospital = "universal"
                    } label: {
                        VStack{
                            
                            Text("Universal Health Services")
                                .fontWeight(.bold)
                                .font(.headline)
                            
                        
                        }
                        .frame(width:175, height: 75)
                        .foregroundColor(.white)
                        .background(Color(hospital == "universal" ?.systemGray2: .systemBlue))
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                    }
                    
                    
                    
                }
                
                
                Divider()
                    .background(Color(.darkGray))
                    .padding(.horizontal, 32)
                    .padding(.top, 15)
                
                CustomInputField(imageName: "cross", placeHolderText: "Medical License Number", text: $medicalLicenseNumber)
                    .padding(.horizontal, 32)
                    .padding(.top, 20)
                
                

                
                Button {
                    viewModel.uploadPsychiatristAdditionalData(hospital, medicalLicenseNumber: medicalLicenseNumber)
//                    isProfilePhotoSelecterActive = true
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
//            .navigationDestination(isPresented: $isProfilePhotoSelecterActive) {
//                ProfilePhotoSelecterView()
//            }
        }
    }
}
#Preview {
    PsychiatristExtraRegister()
}

