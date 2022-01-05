//
//  ContentView.swift
//  Shared
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        Webservice.shared.authenticate(usrname: "Abhishek Singh", pwd: "pass1234") { result in
            switch result {
            case .success(let loginResponse):
                print(loginResponse)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
