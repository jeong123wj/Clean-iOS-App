//
//  FetchAllProductsUseCase.swift
//  SimpleIOSApp
//
//  Created by Woojin on 5/1/24.
//

import Foundation
import Combine

class FetchAllProductsUseCase {
    private let productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func execute() -> AnyPublisher<[Product], Error> {
        return self.productRepository.fetchAllProducts()
    }
}
