//
//  CustomInputField.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/6/24.
//

import SwiftUI

struct CustomInputField: View {
    let imageName : String
    let placeHolderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField ?? false{
                    SecureField(placeHolderText, text: $text)
                }else{
                    TextField(placeHolderText, text: $text)
                        .autocapitalization(.none)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

#Preview {
    CustomInputField(imageName: "envelope", placeHolderText: "Email", text: .constant(""))
}
