//
//  FetchProductDetailUseCase.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Combine

class FetchProductDetailUseCase {
    private let productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func execute(id: Int64) -> AnyPublisher<ProductDetail, Error> {
        return self.productRepository.fetchProductDetail(id: id)
    }
}
