//
//  ProductDetailView.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import SwiftUI
import Swinject

struct ProductDetailView: View {
    @StateObject var productDetailViewModel: ProductDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let productDetail = self.productDetailViewModel.productDetail {
                    AsyncImage(url: URL(string: productDetail.image)) { image in
                        image.image?.resizable().scaledToFit()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .padding(.bottom, 40)
                    
                    Text(productDetail.title)
                        .font(.system(size: 24, weight: .bold))
                        .padding(.bottom, 10)
                    
                    Text(NumberFormatter.USDFormatter.string(from: NSNumber(value: productDetail.price)) ?? "")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.bottom, 10)
                    
                    Text(productDetail.description)
                        .font(.system(size: 16, weight: .bold))
                        .padding(.bottom, 10)
                    
                    Text(productDetail.details)
                        .font(.system(size: 16))
                } else {
                    ProgressView()
                        .controlSize(.extraLarge)
                }
            }
            .padding(10)
        }
        .baseErrorAlert(baseViewModel: self.productDetailViewModel)
    }
}

#Preview {
    Assembler.shared.resolver.resolve(ProductDetailView.self, argument: Int64(1))
}
