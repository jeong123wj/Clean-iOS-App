//
//  PresentationAssembly.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Swinject

class PresentationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ProductListView.self) { r in
            let productListViewModel = r.resolve(ProductListViewModel.self)!
            return ProductListView(productListViewModel: productListViewModel)
        }
        
        container.register(ProductListViewModel.self) { r in
            let fetchAllProductsUseCase = r.resolve(FetchAllProductsUseCase.self)!
            return ProductListViewModel(fetchAllProductsUseCase: fetchAllProductsUseCase)
        }
        
        container.register(ProductDetailView.self) { (r, productId: Int64) in
            let productDetailViewModel = r.resolve(ProductDetailViewModel.self, argument: productId)!
            return ProductDetailView(productDetailViewModel: productDetailViewModel)
        }
        
        container.register(ProductDetailViewModel.self) { (r, productId: Int64) in
            let fetchProductDetailUseCase = r.resolve(FetchProductDetailUseCase.self)!
            return ProductDetailViewModel(fetchProductDetailUseCase: fetchProductDetailUseCase, productId: productId)
        }
    }
}
