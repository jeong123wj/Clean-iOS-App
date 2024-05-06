//
//  BaseViewModifier.swift
//  SimpleIOSApp
//
//  Created by Woojin on 5/7/24.
//

import Foundation
import SwiftUI

extension View {
    func baseErrorAlert(baseViewModel: BaseViewModel) -> some View {
        modifier(BaseErrorAlert(baseViewModel: baseViewModel))
    }
}

private struct BaseErrorAlert: ViewModifier {
    @ObservedObject var baseViewModel: BaseViewModel
    
    func body(content: Content) -> some View {
        content
            .alert("Error", isPresented: self.$baseViewModel.showError, presenting: self.baseViewModel.error) { _ in
                Button("OK") {
                    self.baseViewModel.error = nil
                }
            } message: { error in
                Text("\(error)")
            }
    }
}
