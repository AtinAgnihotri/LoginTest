//
//  LoginButton.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct LoginButton: View {
    let action: () -> Void
    @Binding var isLoading: Bool
    var body: some View {
        Button(action: action) {
            Text(isLoading ? "Loading" : "Proceed")
        }
        .padding()
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 3)
                )
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(action: {
            print("Hello")
        }, isLoading: .constant(true))
    }
}
