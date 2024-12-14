//
//  myMarketListApp.swift
//  myMarketList
//
//  Created by ÖMER  on 13.12.2024.
//

import SwiftUI
import SwiftData

@main
struct myMarketListApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            MarketEntry.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    
    
    var body: some Scene {
        WindowGroup {
            MarketEntriesListView()
        }
        .modelContainer(sharedModelContainer)
    }
    
    
}
