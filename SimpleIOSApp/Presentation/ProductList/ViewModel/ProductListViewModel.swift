//
//  ProductListViewModel.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Combine

class ProductListViewModel: BaseViewModel {
    @Published var productArray: [Product] = []
    
    private let fetchAllProductsUseCase: FetchAllProductsUseCase
    
    init(fetchAllProductsUseCase: FetchAllProductsUseCase) {
        self.fetchAllProductsUseCase = fetchAllProductsUseCase
        
        super.init()
        
        self.fetchAllProductsUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.error = error
                    self?.showError = true
                }
            } receiveValue: { [weak self] productArray in
                self?.productArray = productArray
            }
            .store(in: &self.cancellableBag)
    }
}
