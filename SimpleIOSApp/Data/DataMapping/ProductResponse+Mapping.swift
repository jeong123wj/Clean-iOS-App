//
//  ProductResponse+Mapping.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation

struct ProductResponse: Decodable {
    let id: Int64
    let title: String
    let price: Double
    let category: String
    let description: String
    let image: String
}

extension ProductResponse {
    func toDomain() -> Product {
        return Product(id: self.id,
                       title: self.title,
                       price: self.price,
                       image: self.image)
    }
}
