//
//  ContentEntity+CoreDataProperties.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//
//

import Foundation
import CoreData


extension ContentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContentEntity> {
        return NSFetchRequest<ContentEntity>(entityName: "ContentEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var sku: String?
    @NSManaged public var productName: String?
    @NSManaged public var productImage: String?
    @NSManaged public var productRating: String?
    @NSManaged public var actualPrice: String?
    @NSManaged public var offerPrice: String?
    @NSManaged public var discount: String?
    @NSManaged public var shop: ShopEntity?

}

extension ContentEntity : Identifiable {

}
