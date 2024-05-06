//
//  DomainAssembly.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Swinject

class DomainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FetchAllProductsUseCase.self) { r in
            let productRepository = r.resolve(ProductRepository.self)!
            return FetchAllProductsUseCase(productRepository: productRepository)
        }
        
        container.register(FetchProductDetailUseCase.self) { r in
            let productRepository = r.resolve(ProductRepository.self)!
            return FetchProductDetailUseCase(productRepository: productRepository)
        }
    }
}
