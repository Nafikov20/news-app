//
//  ContentView.swift
//  NewsApp
//
//  Created by Ильхам  on 13.11.2026.
//

import SwiftUI

struct HomeView: View {
    //MARK: - Properties
    @StateObject var vm = ViewModel()
    
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                //MARK: - top news
                Text("Top News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(vm.topNews, id: \.url) {article in
                            
                            NavigationLink(destination: DetailView(article: article)) {
                                TopArticleView(article: article)
                            }
                            .buttonStyle(.plain)
                            
                        }
                    }
                }
                .padding(.horizontal)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 8)
                
                
                //MARK: - bottom news
                Text("Bottom News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(vm.bottomNews, id: \.url) {article in
                            NavigationLink(destination: DetailView(article: article)) {
                                BottomArticleView(article: article)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal)
                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: 8)
            }
            .background(.secondary.opacity(0.3))
            .refreshable {
                vm.fetchBottomNews()
                vm.fetchTopNews()
            }
        }
    }
    
    
}

#Preview {
    HomeView()
}

