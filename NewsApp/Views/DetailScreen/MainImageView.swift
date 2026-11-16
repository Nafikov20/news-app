//
//  MainImageView.swift
//  NewsApp
//
//  Created by Ильхам  on 16.11.2026.
//

import SwiftUI

struct MainImageView: View {
    let article: Article
    let avatarHeight: CGFloat
    
    var body: some View {
        GeometryReader { reader in

            if let url = article.urlToImage,
               let imageUrl = URL(string: url) {

                AsyncImage(url: imageUrl) { phase in

                    if let image = phase.image {

                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -reader.frame(in: .global).minY)
                            .frame(
                                width: reader.size.width,
                                height: reader.frame(in: .global).minY
                                    + avatarHeight + 15
                            )
                    }
                }
            }
        }
        .frame(height: avatarHeight)
    }
}

