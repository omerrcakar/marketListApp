//
//  marketListApp.swift
//  marketList
//
//  Created by ÖMER  on 13.12.2024.
//

import SwiftUI
import SwiftData

@main
struct marketListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: MarketModel.self)
        }
    }
}
