//
//  MarketEntryDetailView.swift
//  myMarketList
//
//  Created by ÖMER  on 13.12.2024.
//

import SwiftUI

struct MarketEntryDetailView: View {
    
    let marketEntry: MarketEntry
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading ,spacing: 15){
                HStack{
                    Text(String(repeating: "⭐️", count: marketEntry.rating))
                        .font(.title2)
                    Text(marketEntry.date, style: .date)
                        .font(.title3)
                    Spacer()
                }
                
                Text(marketEntry.text)
                    .bold()
            }
            .padding()
        }
        .navigationTitle(marketEntry.title)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    NavigationStack {
        MarketEntryDetailView(marketEntry: MarketEntry(title: "Market Entry Detail view", text: "Deneme", rating: 2, date: Date()))
    }
}
