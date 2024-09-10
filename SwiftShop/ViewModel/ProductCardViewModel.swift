//
//  ProductCardViewModel.swift
//  SwiftShop
//
//  Created by Jinu on 10/09/2024.
//

import Foundation

class ProductCardViewModel: ObservableObject {
    let content: Content?
    
    init(content: Content?) {
        self.content = content
    }

    var productRating: Int? {
        guard let ratingString = content?.productRating else {
            return nil
        }
        return Int(ratingString)
    }
    
    var offerPrice: String? {
        content?.offerPrice
    }

    var actualPrice: String? {
        content?.actualPrice
    }

    var discount: String? {
        guard let offerPrice = cleanedPrice(from: offerPrice),
              let actualPrice = cleanedPrice(from: actualPrice),
              offerPrice > 0, actualPrice != offerPrice else {
            return nil
        }
        let discountPercentage = ((actualPrice - offerPrice) / actualPrice) * 100
        return "\(Int(discountPercentage))% Off"
    }

    private func cleanedPrice(from priceString: String?) -> Double? {
        guard let priceString = priceString else { return nil }
        let cleanedString = priceString
            .components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
        return Double(cleanedString)
    }
}
