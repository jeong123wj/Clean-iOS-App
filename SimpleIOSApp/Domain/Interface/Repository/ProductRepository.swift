//
//  ProductRepository.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Combine

protocol ProductRepository {
    func fetchAllProducts() -> AnyPublisher<[Product], Error>
    func fetchProductDetail(id: Int64) -> AnyPublisher<ProductDetail, Error>
}
