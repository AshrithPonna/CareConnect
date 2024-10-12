//
//  ProfilePhotoSelecterView.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/8/24.
//

import SwiftUI

struct ProfilePhotoSelecterView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthenticationHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        
                }else{
                    Image("PhotoUpload")
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(Color(.systemBlue))
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        
                        
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            if let selectedImage = selectedImage{
                Button {
                    viewModel.uploadProfileImage(selectedImage)
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
            }

            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else{ return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            
    }
}

#Preview {
    ProfilePhotoSelecterView()
}
