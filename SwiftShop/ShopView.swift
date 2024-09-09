//
//  ContentView.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.shopElements.indices, id: \.self) { index in
                let element = viewModel.shopElements[index]
                switch element.type {
                case "catagories":
                    CategorySectionView(contents: element.contents ?? [])
                case "banner_slider":
                    BannerSliderView(contents: element.contents ?? [])
                case "banner_single":
                    SingleBannerView(content: element.contents?.first)
                case "products":
                    ProductSectionView(contents: element.contents ?? [])
                default:
                    EmptyView()
                }
            }
        }
    }
}
