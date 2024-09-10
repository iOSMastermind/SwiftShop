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
//    let content:ShopModelElement?

    var body: some View {
           VStack {
               TabView {
                   ForEach(contents) { content in
                       if let imageURL = content.imageURL, let url = URL(string: imageURL) {
                           KFImage(url)
                               .placeholder {
                                   Image(systemName: "photo.fill")
                                       .resizable()
                                       .scaledToFill()
                                       .frame(width: UIScreen.main.bounds.width, height: 150)
                                       .foregroundColor(.gray)
                                       .clipped()
                               }
                               .resizable()
                               .scaledToFill()
                               .frame(width: UIScreen.main.bounds.width, height: 150)
                               .clipped()
                       }
                   }
               }
               
               .tabViewStyle(PageTabViewStyle())
               .frame(height: 150) 
           }
        
       }
   }
