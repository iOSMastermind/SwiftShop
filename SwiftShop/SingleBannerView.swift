//
//  SingleBannerView.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI
import Kingfisher

struct SingleBannerView: View {
    let content: Content?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Single Banner")
                .font(.headline)
                .padding(.bottom, 5)
            
            if let content = content {
                if let imageURL = content.imageURL, let url = URL(string: imageURL) {
                    KFImage(url)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                }
            }
        }
        .padding()
    }
}
