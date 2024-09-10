//
//  CategoryView.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI
import Kingfisher

struct CategorySectionView: View {
//    let contents: [Content]
    let content:ShopModelElement?

    var body: some View {
        VStack(alignment: .leading) {

            SectionHeaderView(title: content?.title ?? "")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(content?.contents ?? []) { content in
                        VStack {
                            if let imageURL = content.imageURL, let url = URL(string: imageURL) {
                                KFImage(url)
                                    .placeholder {
                                        Image(systemName: "photo.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.gray)
                                            .clipped()
                                    }
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50) 
                                    .clipped() 
                            }

                            Text(content.title ?? "")
                                .font(.caption)
                                .lineLimit(1)
                        }
                        .frame(width: 76, height: 64)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .padding(5)
                    }
                }
                .padding(.leading,16)
            }
        }
        .padding([.top, .bottom], 10)
    }
}

