//
//  ProductView .swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//


import SwiftUI
import Kingfisher

struct ProductSectionView: View {
    let contents: [Content]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Products")
                .font(.headline)
                .padding(.bottom, 5)
            
            ScrollView(.vertical) {
                ForEach(contents) { content in
                    HStack {
                        if let imageURL = content.productImage, let url = URL(string: imageURL) {
                            KFImage(url)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }
                        VStack(alignment: .leading) {
                            Text(content.productName ?? "")
                                .font(.headline)
                            Text(content.actualPrice ?? "")
                                .font(.subheadline)
                                .foregroundColor(.green)
                            if let offerPrice = content.offerPrice {
                                Text(offerPrice)
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.leading, 10)
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
}
