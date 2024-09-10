//
//  ProductCardView.swift
//  SwiftShop
//
//  Created by Jinu on 10/09/2024.
//

import SwiftUI
import Kingfisher

struct ProductCardView: View {
    @ObservedObject var viewModel: ProductCardViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            if let imageURL = viewModel.content?.productImage, let url = URL(string: imageURL) {
                KFImage(url)
                    .placeholder {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .padding(.top, 10)
                            .foregroundColor(.gray)
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            }
            
            if let discount = viewModel.discount {
                HStack {
                    Text("Sale \(discount)")
                        .font(.system(size: 8, weight: .medium))
                        .foregroundColor(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(Color(hex: "#EB8359"))
                        .cornerRadius(8)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
            }
            
            Text(viewModel.content?.productName ?? "")
                .font(.system(size: 8, weight: .medium))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .padding(.horizontal, 10)
            
            HStack(spacing: 2) {
                ForEach(0..<5) { index in
                    if let rating = viewModel.productRating {
                        Image(systemName: index < rating ? "star.fill" : "star")
                            .foregroundColor(index < rating ? .yellow : .gray)
                            .font(.system(size: 10))
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(.gray)
                            .font(.system(size: 10))
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 10)

            HStack(spacing: 5) {
                Text(viewModel.offerPrice ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.black)

                Text(viewModel.actualPrice ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .strikethrough()
                Spacer()
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .frame(width: 170, height: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 5)
        .padding([.top, .bottom], 10)
    }
}
