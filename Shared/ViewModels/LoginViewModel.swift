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
    @Published var userName: String = ""
    
    private func getErrorMessage(for err: NetworkError) -> String {
        switch err {
            case .decodingError, .domainError: return "😵 Snap! Looks like something broke on our end. Please try again."
            case .badUrl: return "Okay, this should never have made it to production. If you're seeing this, and don't work with us, get ready to collect your bug bounty! 🤑"
            case .serverError: return "😓 It seems our services are down at the moment. Please try again later."
        }
    }
    
    func authenticate(userName: String, password: String) {
        isLoading = true
        Webservice.shared.authenticate(usrname: userName, pwd: password) { [weak self] result in
            switch result {
                case .success(let loginResponse):
                    print("INFO :: LOGIN SUCCEEDED : \(loginResponse)")
                    self?.userName = loginResponse.fullName
                    self?.proceedWithLogin = true
                case .failure(let error):
                    print("ERROR :: LOGIN FAILED : \(error)")
                    AppUtils.shared.showAlert(title: "🚨 Error", message: self?.getErrorMessage(for: error))
            }
            self?.isLoading = false
        }
    }
}
