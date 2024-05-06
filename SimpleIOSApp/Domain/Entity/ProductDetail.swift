//
//  ProductDetail.swift
//  SimpleIOSApp
//
//  Created by Woojin on 5/1/24.
//

import Foundation

struct ProductDetail: Identifiable {
    let id: Int64
    let title: String
    let price: Double
    let category: String
    let description: String
    let image: String
    let details: String
}
