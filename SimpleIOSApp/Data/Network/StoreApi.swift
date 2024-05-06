//
//  StoreApi.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Combine

class StoreApi {
    private let httpService: HttpService
    
    init(httpService: HttpService) {
        self.httpService = httpService
    }
    
    func fetchAllProducts() -> AnyPublisher<[ProductResponse], Error> {
        return self.httpService.request(
            path: "/products",
            method: .get
        )
    }
    
    func fetchProductDetail(id: Int64) -> AnyPublisher<ProductDetailResponse, Error> {
        return self.httpService.request(
            path: "/products/\(id)",
            method: .get
        )
    }
}
