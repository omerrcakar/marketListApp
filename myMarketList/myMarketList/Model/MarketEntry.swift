//
//  MarketEntry.swift
//  myMarketList
//
//  Created by ÖMER  on 13.12.2024.
//

import Foundation
import SwiftData

// @Model : this class can now be saved into swift data
// and you can pul things out, you can edit and delete them

@Model
final class MarketEntry : Identifiable{
    
    var title: String = ""
    var text: String = ""
    var rating: Int = 1
    var date: Date = Date()
    
    init (title: String, text: String, rating: Int, date: Date){
        self.title = title
        self.text = text
        self.rating = rating
        self.date = date
    }
    
}

//let marketEntries: [MarketEntry] = [MarketEntry(title: "2kg patlıcan", text: "Pazar", rating: 2, date: Date())]
