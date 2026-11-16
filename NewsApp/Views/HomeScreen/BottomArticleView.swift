//
//  BottomArticleView.swift
//  NewsApp
//
//  Created by Ильхам  on 16.11.2026.
//

import SwiftUI

struct BottomArticleView: View {
    
    //MARK: - Proprties
    let article: Article
    
    //MARK: - Body
    var body: some View {
        VStack {
            if let url = article.urlToImage, let imgUrl = URL(string: url) {
                AsyncImage(url: imgUrl) {phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                    }
                }
            } else {
                ZStack {
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.secondary)
                        .opacity(0.3)
                        .cornerRadius(10)
                    
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundStyle(.secondary)
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(height: 50)
                    
                }
            }
            
            
            VStack(alignment: .leading) {
                Text(article.title ?? "")
                    .titleFont()
                Spacer()
                Text(article.publishedAt.convertDate())
                    .descriptionFont()
            }
        }
        .frame(width: 120, height: 240)
        .padding(10)
        .background(.background)
        .cornerRadius(10)
    }
}
