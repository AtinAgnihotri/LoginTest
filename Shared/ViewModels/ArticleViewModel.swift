//
//  ArticleViewModel.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import Foundation

class ArticleViewModel: ObservableObject {
    private let article: Article
    let id: UUID
    @Published var isLiked: Bool
    
    init(_ article: Article, isLiked: Bool) {
        self.article = article
        self.isLiked = isLiked
        self.id = UUID()
    }
    
    var headline: String {
        article.title
    }
    
    var sourceName: String {
        article.source.name
    }
    
    var publishedOn: String {
        guard let date = try? Date(article.publishedAt, strategy: .iso8601) else {
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
    
    func like() {
        isLiked = true
    }
    
    func unlike() {
        isLiked = false
    }
    
}
