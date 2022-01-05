//
//  LoginViewModel.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var proceedWithLogin: Bool = false
    @Published var isLoading: Bool = false
    
    func authenticate(userName: String, password: String) {
        isLoading = true
        Webservice.shared.authenticate(usrname: userName, pwd: password) { [weak self] result in
            switch result {
                case .success(let loginResponse):
                    print("INFO :: LOGIN SUCCEEDED : \(loginResponse)")
                    self?.proceedWithLogin = true
                case .failure(let error):
                    print("ERROR :: LOGIN FAILED : \(error)")
            }
            self?.isLoading = false
        }
    }
}
