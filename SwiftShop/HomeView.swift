//
//  HomeView.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

//import SwiftUI
//import Kingfisher
//
//// Home View showing dynamic sections based on API response
//struct HomeView: View {
//    @ObservedObject var viewModel: MainViewModel
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading) {
//                if !viewModel.categories.isEmpty {
//                    SectionHeader(title: "Categories")
//                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 16) {
//                            ForEach(viewModel.categories, id: \.sku) { category in
//                                CategoryView(category: category)
//                            }
//                        }
//                        .padding()
//                    }
//                }
//
//                if !viewModel.sliderBanners.isEmpty {
//                    SectionHeader(title: "Slider Banners")
//
//                    TabView {
//                        ForEach(viewModel.sliderBanners) { banner in
//                            BannerView(banner: banner)
//                        }
//                    }
//                    .frame(height: 200)
//                    .tabViewStyle(PageTabViewStyle())
//                    .padding()
//                }
//
//                if let banner = viewModel.singleBanner {
//                    SectionHeader(title: "Single Banner")
//
//                    BannerView(banner: banner)
//                        .frame(height: 200)
//                        .padding()
//                }
//
//                if !viewModel.products.isEmpty {
//                    SectionHeader(title: "Products")
//
//                    ForEach(viewModel.products, id: \.sku) { product in
//                        ProductView(product: product)
//                            .padding(.horizontal)
//                            .padding(.vertical, 8)
//                    }
//                }
//            }
//        }
//    }
//}
//
//// View for displaying section headers
//struct SectionHeader: View {
//    let title: String
//
//    var body: some View {
//        Text(title)
//            .font(.headline)
//            .padding(.leading)
//    }
//}
