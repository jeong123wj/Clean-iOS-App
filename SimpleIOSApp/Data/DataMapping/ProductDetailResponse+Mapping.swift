//
//  ProductDetailResponse+Mapping.swift
//  SimpleIOSApp
//
//  Created by Woojin on 5/1/24.
//

import Foundation

struct ProductDetailResponse: Decodable {
    let id: Int64
    let title: String
    let price: Double
    let category: String
    let description: String
    let image: String
    let details: String = String(repeating: "details ", count: 100)
}

extension ProductDetailResponse {
    func toDomain() -> ProductDetail {
        return ProductDetail(id: self.id,
                             title: self.title,
                             price: self.price,
                             category: self.category,
                             description: self.description,
                             image: self.image,
                             details: self.details)
    }
}
