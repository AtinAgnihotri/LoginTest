//
//  Webservice.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import Foundation



public enum NetworkError: Error {
    case badUrl
    case domainError
    case decodingError
    case serverError
}

class Webservice {
    
    let NEWS_API_URL = "https://api.npoint.io/7c27fa874f0a4d46e4d4"
    let LOGIN_API_URL = "https://api.npoint.io/0774724810730d4ee184"
    
    public static let shared = Webservice()
        
    private init () {
        
    }
    
    private func makeRequest<T: Decodable>(with endpoint: String, onCompletion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: endpoint) else {
            DispatchQueue.main.async {
                onCompletion(.failure(.domainError))
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    onCompletion(.failure(.serverError))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    onCompletion(.failure(.domainError))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let decodedData = try? decoder.decode(T.self, from: data) else {
                DispatchQueue.main.async {
                    onCompletion(.failure(.decodingError))
                }
                return
            }
            
            DispatchQueue.main.async {
                onCompletion(.success(decodedData))
            }
            
        }.resume()
    }
    
    public func authenticate(onCompletion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        makeRequest(with: LOGIN_API_URL, onCompletion: onCompletion)
    }
    
    public func fetchNews(onCompletion: @escaping (Result<ArticleResponse, NetworkError>) -> Void) {
        makeRequest(with: NEWS_API_URL, onCompletion: onCompletion)
    }
    
}
