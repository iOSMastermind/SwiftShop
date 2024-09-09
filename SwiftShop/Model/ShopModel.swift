//
//  ShopModel.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import Foundation

struct ShopModelElement: Codable {
    let type, title: String
    let contents: [Content]?
    let id: String
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case type, title, contents, id
        case imageURL = "image_url"
    }
}

struct Content: Codable,Identifiable {
    var id = NSUUID().uuidString

    let title: String?
    let imageURL: String?
    let sku, productName: String?
    let productImage: String?
    let productRating: Int?
    let actualPrice, offerPrice, discount: String?

    enum CodingKeys: String, CodingKey {
        case title
        case imageURL = "image_url"
        case sku
        case productName = "product_name"
        case productImage = "product_image"
        case productRating = "product_rating"
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case discount
    }
}

typealias ShopModel = [ShopModelElement]
