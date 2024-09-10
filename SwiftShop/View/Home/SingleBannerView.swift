//
//  SingleBannerView.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI
import Kingfisher

struct SingleBannerView: View {
    let content: ShopModelElement?

    var body: some View {
        VStack(alignment: .center,spacing: 0) {
            if let content = content {
                if let imageURL = content.imageURL, let url = URL(string: imageURL) {
                    KFImage(url)
                        .placeholder {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                                .foregroundColor(.gray)
                                .clipped()
                        }
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .clipped() 
                }
            }
        }
    }
}
