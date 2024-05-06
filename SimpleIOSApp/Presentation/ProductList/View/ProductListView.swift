//
//  ProductListView.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import SwiftUI
import Swinject

struct ProductListView: View {
    @StateObject var productListViewModel: ProductListViewModel
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: self.columns) {
                    ForEach(self.productListViewModel.productArray) { product in
                        NavigationLink(value: product.id) {
                            VStack {
                                AsyncImage(url: URL(string: product.image)) { image in
                                    image.image?.resizable().scaledToFit()
                                }
                                .frame(width: 100, height: 100)
                                Text(product.title)
                                    .font(.system(size: 14))
                                    .multilineTextAlignment(.center)
                                Text(NumberFormatter.USDFormatter.string(from: NSNumber(value: product.price)) ?? "")
                                    .font(.system(size: 16, weight: .bold))
                            }
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .border(.black, width: 2)
                            .padding(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(10)
            }
            .navigationDestination(for: Int64.self) { productId in
                Assembler.shared.resolver.resolve(ProductDetailView.self, argument: productId)
            }
            .navigationTitle("상품 목록")
            .baseErrorAlert(baseViewModel: self.productListViewModel)
        }
    }
}

#Preview {
    Assembler.shared.resolver.resolve(ProductListView.self)
}
