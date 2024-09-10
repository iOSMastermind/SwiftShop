//
//  ProductView .swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//


import SwiftUI
import Kingfisher

struct ProductSectionView: View {
//    let contents: [Content]
    let content:ShopModelElement?

    
    var imageUrl: String = "backpack_image_url"
        var productName: String = "Mi Multicolor Mini Backpack Travel Backpack"
        var rating: Int = 4
        var originalPrice: String = "৳300"
        var discountedPrice: String = "৳100"
        var discount: String = "65% Off"

    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {

            SectionHeaderView(title: content?.title ?? "")

            ScrollView(.horizontal, showsIndicators: false) {

                    HStack {
                        ForEach(content?.contents ?? []) { content in
                            ProductCardView(viewModel: ProductCardViewModel(content: content))

                        }
                    }
                    .padding(.leading,16)


            }

        }
    }
}
