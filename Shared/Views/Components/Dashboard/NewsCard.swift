//
//  NewsCard.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct NewsCard: View {
    @ObservedObject var articleVM: ArticleViewModel
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                NavigationLink(
                    destination: DetailedView(articleVM: articleVM)) {
                    EmptyView()
                }
                .opacity(0)

                VStack {
                    HStack {
                        Text(articleVM.headline)
                            .font(.headline)
                            .padding()
                        Spacer()
                    }
                    HStack {
                        Text("Published By \(articleVM.author ?? articleVM.sourceName)")
                            .padding(.horizontal)
                        Spacer()
                    }
                    HStack {
                        Text("On \(articleVM.publishedOn)")
                            .padding(.horizontal)
                            .padding(.bottom)
                        Spacer()
                    }
                }
                
            }
            Spacer()
            LikeButton(action: toggleLike, isLiked: $articleVM.isLiked)
        }
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                )
        .shadow(radius: 25)
        .padding()
        .buttonStyle(BorderlessButtonStyle())
    }
    
    func toggleLike() {
        articleVM.isLiked.toggle()
    }
}
