//
//  NumberFormatterExtension.swift
//  SimpleIOSApp
//
//  Created by Woojin on 5/6/24.
//

import Foundation

extension NumberFormatter {
    static let USDFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = "USD"
        return numberFormatter
    }()
}
