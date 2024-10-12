//
//  TextArea.swift
//  LocalTennisApp
//
//  Created by Ansh Gupta on 8/1/24.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    init(placeholder: String, text: Binding<String>) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance()
    }
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty{
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 10)
            }
            
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}
