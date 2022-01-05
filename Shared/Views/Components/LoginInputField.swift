//
//  LoginInputField.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct LoginInputField: View {
    let key: String
    @Binding var binding: String
    let prompt: String
    var secure: Bool = false
    
    
    var body: some View {
        if secure {
            SecureField(key, text: $binding, prompt: Text(prompt))
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 3)
                        )
        } else {
            TextField(key, text: $binding, prompt: Text(prompt))
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 3)
                        )
        }
    }
}

struct LoginInputField_Previews: PreviewProvider {
    static var previews: some View {
        LoginInputField(key: "Test Field", binding: .constant("Hello"), prompt: "Enter Test Data")
    }
}
