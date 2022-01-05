//
//  NewsCard.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct NewsCard: View {
    let articleVM: ArticleViewModel
    
    var body: some View {
        NavigationLink(destination: Text(articleVM.headline)) {
            VStack {
                Text(articleVM.headline)
                    .font(.headline)
                HStack {
                    Text("Published By \(articleVM.author ?? articleVM.sourceName)")
                    Spacer()
                    Text("On \(articleVM.publishedOn)")
                }
            }
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                    )
            .shadow(radius: 25)
        }
    }
}

//struct NewsCard_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsCard(.)
//    }
//}
