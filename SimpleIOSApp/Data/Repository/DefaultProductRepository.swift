//
//  DefaultProductRepository.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Combine

class DefaultProductRepository: ProductRepository {
    private let storeApi: StoreApi
    
    init(storeApi: StoreApi) {
        self.storeApi = storeApi
    }
    
    func fetchAllProducts() -> AnyPublisher<[Product], Error> {
        return storeApi.fetchAllProducts()
            .map { productResponseArray in
                return productResponseArray.map { $0.toDomain() }
            }
            .eraseToAnyPublisher()
    }
    
    func fetchProductDetail(id: Int64) -> AnyPublisher<ProductDetail, Error> {
        return storeApi.fetchProductDetail(id: id)
            .map { productDetailResponse in
                return productDetailResponse.toDomain()
            }
            .eraseToAnyPublisher()
    }
}
