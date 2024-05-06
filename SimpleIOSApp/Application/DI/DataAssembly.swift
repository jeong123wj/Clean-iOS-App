//
//  DataAssembly.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import Foundation
import Swinject

class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ProductRepository.self) { r in
            let storeApi = r.resolve(StoreApi.self)!
            return DefaultProductRepository(storeApi: storeApi)
        }
        
        container.register(StoreApi.self) { r in
            let httpService = r.resolve(HttpService.self)!
            return StoreApi(httpService: httpService)
        }
        
        container.register(HttpService.self) { r in
            return HttpService(baseUrl: "https://fakestoreapi.com/")
        }
    }
}
