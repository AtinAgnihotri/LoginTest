//
//  DetailedView.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct DetailedView: View {
    @ObservedObject var articleVM: ArticleViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(articleVM.headline)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                    LikeButton(action: toggleLike, isLiked: $articleVM.isLiked)
                }
                
                if let imageUrl = articleVM.imageUrl {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    } placeholder: {
                        Text("Loading Image")
                    }
                }
                
                VStack {
                    HStack {
                        Text("Published by \(articleVM.author ?? articleVM.sourceName)")
                                .font(.headline)
                        Spacer()
                    }
                    
                    HStack {
                        Text("On \(articleVM.publishedOn)")
                                .font(.headline)
                        Spacer()
                    }
                }.padding(.vertical)
                
                if articleVM.hasDescription {
                    HStack {
                        Text(articleVM.description)
                                .font(.body)
                        Spacer()
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
        }.padding()

    }
    
    func toggleLike() {
        articleVM.isLiked.toggle()
    }
}

