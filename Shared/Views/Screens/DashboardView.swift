//
//  DashboardView.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import SwiftUI

struct DashboardView: View {
    let userName: String
    @ObservedObject var articleController = DashboardViewModel.shared
    
    
    var body: some View {
        VStack {
            if articleController.isLoading {
                Text("Getting your articles!")
                    .font(.headline)
            } else if articleController.noArticlesLoaded {
                Text("Oops! Something went wrong. Please try again!")
                    .font(.headline)
                Button(action: articleController.fetchArticles) {
                    Text("Retry")
                        .background(Color.black)
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(10)
                }
            } else {
                List(articleController.articles, id:\.id) { articleVM in
                    NewsCard(articleVM: articleVM)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        
                }
                .listStyle(PlainListStyle())
                .listRowSeparator(.hidden)
            }
        }
        .navigationTitle("Hey \(userName)!")
        .navigationBarBackButtonHidden(true)
        .onAppear {
            articleController.firstFetch()
        }
        .refreshable {
            articleController.fetchArticles()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(userName: "ehllo")
    }
}
