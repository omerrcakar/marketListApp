//
//  ContentView.swift
//  myMarketList
//
//  Created by ÖMER  on 13.12.2024.
//

import SwiftUI
import SwiftData

struct MarketEntriesListView: View {
    
    // Model context: bridge between our app and swift data
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MarketEntry.date, order: .reverse) private var marketEntries: [MarketEntry] // get information out of swift data
    
    @State private var isSheetShowing: Bool = false
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    @State private var text: String = ""
    
    
    var body: some View {
        NavigationStack {
            List(marketEntries){ market in
                
                NavigationLink(destination: EditMarketEntryView(editingMarketEntry: market)){
                    MarketEntryRowView(marketEntry: market)
                        .swipeActions{
                            Button("Delete", role: .destructive){
                                modelContext.delete(market)
                            }
                        }
                       
                }
                .listRowSeparator(.hidden)
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        isAlertShowing.toggle()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        isSheetShowing.toggle()
                    }label: {
                        Image(systemName: "list.bullet.clipboard")
                    }
                }
                
                if marketEntries.isEmpty != true{
                    ToolbarItem(placement: .bottomBar){
                        Text("\(marketEntries.count) Market List\(marketEntries.count > 1 ? "'s" : "")")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing){
                CreateMarketEntryView()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
            .alert("Create a new Market List", isPresented: $isAlertShowing){
                TextField("Enter a market pieces", text: $title)
                TextField("Enter a Place", text: $text)
                
                Button{
                    modelContext.insert(MarketEntry(title: title, text: text, rating: 2, date: Date()))
                    title = ""
                    text = ""
                }label: {
                    Text("Save")
                }
                
                Button{
                    isAlertShowing = false
                }label : {
                    Text("Cancel")
                }
                
                
                
            }
            .overlay{
                if marketEntries.isEmpty{
                    ContentUnavailableView("My Market List", systemImage: "cart.badge.clock", description: Text("No Market List Found. Add one to get started"))
                }
            }
            .listStyle(.plain)
            .navigationTitle("🛒 Market List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
}

#Preview {
    MarketEntriesListView()
        .modelContainer(for: MarketEntry.self, inMemory: true)
}
