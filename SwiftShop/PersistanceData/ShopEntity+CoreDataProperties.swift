//
//  ShopEntity+CoreDataProperties.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//
//

import Foundation
import CoreData


extension ShopEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShopEntity> {
        return NSFetchRequest<ShopEntity>(entityName: "ShopEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: String?
    @NSManaged public var type: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var contents: NSSet?

}

// MARK: Generated accessors for contents
extension ShopEntity {

    @objc(addContentsObject:)
    @NSManaged public func addToContents(_ value: ContentEntity)

    @objc(removeContentsObject:)
    @NSManaged public func removeFromContents(_ value: ContentEntity)

    @objc(addContents:)
    @NSManaged public func addToContents(_ values: NSSet)

    @objc(removeContents:)
    @NSManaged public func removeFromContents(_ values: NSSet)

}

extension ShopEntity : Identifiable {

}
