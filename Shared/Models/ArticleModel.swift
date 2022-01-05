//
//  NewsModel.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import Foundation

struct ArticleSource: Decodable {
    let id: String?
    let name: String
}

struct Article: Decodable {
    let url: String
    let title: String
    let source: ArticleSource
    let content: String
    let urlToImage: String
    let description: String
    let publishedAt: String
}

struct ArticleResponse: Decodable {
    let status: String
    let articles: [Article]
    let totalResults: Int
}
