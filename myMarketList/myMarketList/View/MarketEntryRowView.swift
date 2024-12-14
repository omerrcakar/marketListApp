//
//  MarketEntryRowView.swift
//  myMarketList
//
//  Created by ÖMER  on 13.12.2024.
//

import SwiftUI

struct MarketEntryRowView: View {
    
    let marketEntry: MarketEntry
    
    var body: some View {
        VStack(alignment: .leading){
            Text(marketEntry.title)
                .bold()
            Text(marketEntry.text)
                .foregroundStyle(.secondary)
        }
        
            
    }
}

#Preview {
    List { 
        MarketEntryRowView(marketEntry: MarketEntry(title: "Market Entry Detail view", text: "Deneme", rating: 2, date: Date()))
    }
}
