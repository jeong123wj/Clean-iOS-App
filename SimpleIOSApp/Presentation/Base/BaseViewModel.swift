//
//  BaseViewModel.swift
//  SimpleIOSApp
//
//  Created by Woojin on 5/7/24.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    @Published var showError: Bool = false
    @Published var error: Error? = nil
    
    var cancellableBag = Set<AnyCancellable>()
}
