//
//  SimpleIOSAppApp.swift
//  SimpleIOSApp
//
//  Created by Woojin on 4/30/24.
//

import SwiftUI
import Swinject

@main
struct SimpleIOSAppApp: App {
    init() {
        Assembler.shared.apply(assemblies: [
            PresentationAssembly(),
            DomainAssembly(),
            DataAssembly()
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            Assembler.shared.resolver.resolve(ProductListView.self)
        }
    }
}
