//
//  ContentView.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                            .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing:0) {
                    ForEach(viewModel.shopElements.indices, id: \.self) { index in
                        let element = viewModel.shopElements[index]
                        switch element.type {
                        case "catagories":
                            CategorySectionView(content: element)
//                                .padding(.leading)
                        case "banner_slider":
                            BannerSliderView(contents: element.contents ?? [])
                            
                        case "banner_single":
                            SingleBannerView(content: element)
                                .padding()
                        case "products":
                            ProductSectionView(content: element)
//                                .padding(.leading)
                        default:
                            EmptyView()
                        }
                    }
                }
            }
        }
        
    }
}
