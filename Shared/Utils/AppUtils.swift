//
//  AppUtils.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

class AppUtils {
    
    struct Constants {
        static let NEWS_API_URL = "https://api.npoint.io/7c27fa874f0a4d46e4d4"
        static let LOGIN_API_URL = "https://api.npoint.io/0774724810730d4ee184"
    }
    
    static let shared = AppUtils()
    
    
    private init() {
        
    }
    
    private func getTopMostController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow,
                let rootViewController = window.rootViewController else {
            return nil
        }

        var topController = rootViewController

        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }

        return topController
    }

    
    func showAlert(title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .default)]) {
        if let topMostVC = getTopMostController() {
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            actions.forEach { ac.addAction($0) }
            topMostVC.present(ac, animated: true)
        }
    }
}


