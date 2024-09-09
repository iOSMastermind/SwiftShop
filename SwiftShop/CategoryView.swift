//
//  CategoryView.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI
import Kingfisher

struct CategorySectionView: View {
    let contents: [Content]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(.headline)
                .padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(contents) { content in
                        VStack {
                            if let imageURL = content.imageURL, let url = URL(string: imageURL) {
                                KFImage(url)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                            }
                            Text(content.title ?? "")
                                .font(.caption)
                                .lineLimit(1)
                        }
                        .padding(5)
                    }
                }
            }
        }
        .padding()
    }
}

