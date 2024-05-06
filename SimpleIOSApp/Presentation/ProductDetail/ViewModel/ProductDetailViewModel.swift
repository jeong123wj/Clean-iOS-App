//
//  ProductDetailViewModel.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Combine

class ProductDetailViewModel: BaseViewModel {
    @Published var productDetail: ProductDetail? = nil
    
    private let fetchProductDetailUseCase: FetchProductDetailUseCase
    
    private let productId: Int64
    
    init(fetchProductDetailUseCase: FetchProductDetailUseCase, productId: Int64) {
        self.fetchProductDetailUseCase = fetchProductDetailUseCase
        self.productId = productId
        
        super.init()
        
        self.fetchProductDetailUseCase.execute(id: self.productId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.error = error
                    self?.showError = true
                }
            } receiveValue: { [weak self] productDetail in
                self?.productDetail = productDetail
            }
            .store(in: &self.cancellableBag)
    }
}
