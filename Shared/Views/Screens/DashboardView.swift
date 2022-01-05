//
//  DashboardView.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct DashboardView: View {
    let userName: String
    
    var body: some View {
        VStack {
            
        }.navigationTitle("Hey \(userName)!")
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(userName: "ehllo")
    }
}
