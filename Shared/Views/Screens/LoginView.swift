//
//  LoginView.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginVM = LoginViewModel()
    
    @State private var userName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("UserNameField", text: $userName, prompt: Text("Enter User name"))
                    .padding()
                    .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 5)
                            )
                TextField("PasswordField", text: $userName, prompt: Text("Enter User name"))
                    .padding()
                    .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 5)
                            )
                Button(action: proceedWithLogin) {
                    if loginVM.isLoading {
                        Text("Loading")
                    } else {
                        Text("Proceed")
                    }
                }
                .padding()
                .border(Color.black)
            }
            .padding()
            .navigationTitle("Login")
        }
    }
    
    func proceedWithLogin() {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
