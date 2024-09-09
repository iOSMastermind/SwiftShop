//
//  MainViewModel.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI
import CoreData

class MainViewModel: ObservableObject {
    @Published var shopElements: [ShopModelElement] = []
    
    private var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
        fetchData()
//        loadDataFromCoreData()
    }

    func fetchData() {
        RequestServices.requestDomain = Constants.Urls.baseURL

        RequestServices.fetchData { [weak self] result in
            switch result {
            case .success(let data):
                guard let data = data else {
                    print("No data received from API.")
                    DispatchQueue.main.async {
                        self?.loadDataFromCoreData()
                    }
                    return
                }
                
                if let shopModel = self?.decodeData(data) {
                    DispatchQueue.main.async {
                        self?.shopElements = shopModel
                        self?.saveDataToCoreData(data: shopModel)
                    }
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
                DispatchQueue.main.async {
                    self?.loadDataFromCoreData()
                }
            }
        }
    }

    private func decodeData(_ data: Data) -> ShopModel? {
        do {
            let decoder = JSONDecoder()
            let shopModel = try decoder.decode(ShopModel.self, from: data)
            return shopModel
        } catch {
            print("Error decoding data: \(error)")
            return nil
        }
    }

    // CoreData operations...

    private func saveDataToCoreData(data: ShopModel) {
        clearCoreData()

        for element in data {
            let shopEntity = ShopEntity(context: context)
            shopEntity.id = element.id
            shopEntity.type = element.type
            shopEntity.title = element.title
            shopEntity.imageURL = element.imageURL
            
            if let contents = element.contents {
                for content in contents {
                    let contentEntity = ContentEntity(context: context)
                    contentEntity.title = content.title
                    contentEntity.imageURL = content.imageURL
                    contentEntity.sku = content.sku
                    contentEntity.productName = content.productName
                    contentEntity.productImage = content.productImage
                    contentEntity.productRating = String(content.productRating ?? 0)
                    contentEntity.actualPrice = content.actualPrice
                    contentEntity.offerPrice = content.offerPrice
                    contentEntity.discount = content.discount
                    contentEntity.shop = shopEntity
                }
            }
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save data to CoreData: \(error.localizedDescription)")
        }
    }

    private func clearCoreData() {
        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ShopEntity")
        let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ContentEntity")
        
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
        let batchDeleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)
        
        do {
            try context.execute(batchDeleteRequest1)
            try context.execute(batchDeleteRequest2)
        } catch {
            print("Failed to clear CoreData: \(error.localizedDescription)")
        }
    }

    private func loadDataFromCoreData() {
        let request: NSFetchRequest<ShopEntity> = ShopEntity.fetchRequest()
        
        do {
            let shopEntities = try context.fetch(request)
            shopElements = shopEntities.map { shopEntity in
                var contents: [Content] = []
                if let contentEntities = shopEntity.contents as? Set<ContentEntity> {
                    contents = contentEntities.map { convertToContent(from: $0) }
                }
                return ShopModelElement(
                    type: shopEntity.type ?? "",
                    title: shopEntity.title ?? "",
                    contents: contents,
                    id: shopEntity.id ?? "",
                    imageURL: shopEntity.imageURL
                )
            }
        } catch {
            print("Failed to load data from CoreData: \(error.localizedDescription)")
        }
    }

    private func convertToContent(from entity: ContentEntity) -> Content {
        return Content(
            title: entity.title,
            imageURL: entity.imageURL,
            sku: entity.sku,
            productName: entity.productName,
            productImage: entity.productImage,
            productRating: Int(entity.productRating ?? "0"),
            actualPrice: entity.actualPrice,
            offerPrice: entity.offerPrice,
            discount: entity.discount
        )
    }
}
