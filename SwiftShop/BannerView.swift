//
//  BannerView.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI
import Kingfisher

struct BannerSliderView: View {
    let contents: [Content]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Slider Banners")
                .font(.headline)
                .padding(.bottom, 5)
            
            TabView {
                ForEach(contents) { content in
                    if let imageURL = content.imageURL, let url = URL(string: imageURL) {
                        KFImage(url)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .padding()
    }
}
