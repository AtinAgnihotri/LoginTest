//
//  ArticleViewModel.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import Foundation

class ArticleViewModel {
    let article: Article
    var isLiked: Bool
    
    init(_ article: Article, isLiked: Bool) {
        self.article = article
        self.isLiked = isLiked
    }
    
    var headline: String {
        article.title
    }
    
    var sourceName: String {
        article.source.name
    }
    
    var publishedOn: String {
        guard let date = try? Date(article.publishedAt, strategy: .dateTime) else {
            return "N/A"
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: date)
    }
    
    var description: String {
        article.description ?? ""
    }
    
    var author: String? {
        article.author
    }
    
}
