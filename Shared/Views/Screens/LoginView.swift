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
                LoginInputField(key: "UserNameField", binding: $userName, prompt: "Enter User name")
                LoginInputField(key: "PasswordField", binding: $password, prompt: "Enter Password", secure: true)
                LoginButton(action: proceedWithLogin, isLoading: $loginVM.isLoading)
                NavigationLink(destination:
                                Text("Welcome back \(loginVM.userName)"),
                               isActive: $loginVM.proceedWithLogin) {
                     EmptyView()
                }.hidden()
            }
            .padding()
            .navigationTitle("Login")
            
        }
    }
    
    func proceedWithLogin() {
        guard !userName.isEmpty else {
            // MARK: SHOW ALERT HERE
            print("Please Enter Username")
            return
        }
        guard !password.isEmpty else {
            // MARK: SHOW ALERT HERE
            print("Please Enter Password")
            return
        }
        loginVM.authenticate(userName: userName, password: password)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
