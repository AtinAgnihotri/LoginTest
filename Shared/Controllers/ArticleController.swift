//
//  ArticleController.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import Foundation

class ArticleController: ObservableObject {
    
    static let shared = ArticleController()
    
    
    
    @Published var articles = [ArticleViewModel]()
    @Published var isLoading = false
    
    private init() {
        
    }
    
    var noArticlesLoaded: Bool {
        articles.isEmpty
    }
    
    func fetchArticles() {
        isLoading = true
        Webservice.shared.fetchNews { [weak self] result in
            switch result {
                case .success(let articleRespone):
                    self?.articles = articleRespone.articles.map { ArticleViewModel.init($0, isLiked: false)
                    }
                    print("INFO :: NEWS FETCHED : \(articleRespone.totalResults) articles fetched")
                case .failure(let error):
                    print("ERROR :: NEWS FETCH FAILED : \(error)")
            }
            self?.isLoading = false
        }
    }
    
    func firstFetch() {
        if articles.isEmpty {
            fetchArticles()
        }
    }
    
}
