//
//  ContentView.swift
//  marketList
//
//  Created by ÖMER  on 13.12.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var marketLists: [MarketModel]
    
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(marketLists) { market in
                    Text(market.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions{
                            Button("Delete", role: .destructive){
                                modelContext.delete(market)
                            }
                           
                        }
                }
            } //: LIST
            .navigationTitle("🛒 MarketList")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
                if marketLists.isEmpty != true{
                    ToolbarItem(placement: .bottomBar){
                        Text("\(marketLists.count) Market List\(marketLists.count > 1 ? "'s" : "")")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .alert("Create a new Market List", isPresented: $isAlertShowing){
                TextField("Enter a Market List", text: $title)
                
                Button{
                    modelContext.insert(MarketModel(title: title))
                    title = ""
                }label: {
                    Text("Save")
                }
            }
            .overlay{
                if marketLists.isEmpty{
                    ContentUnavailableView("My Market List's", systemImage: "cart.badge.clock", description: Text("No Market List Found. Add one to get started"))
                }
            }
            
        }
    }
}

#Preview("List with sample data") {
    let container = try! ModelContainer(for: MarketModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(MarketModel(title: "Master SwiftData"))
    container.mainContext.insert(MarketModel(title: "Buy a new iphone"))
    container.mainContext.insert(MarketModel(title: "Practice English"))
    container.mainContext.insert(MarketModel(title: "Travel Europe"))
    container.mainContext.insert(MarketModel(title: "Make positive impact"))
    
    return ContentView()
        .modelContainer(container)
}


#Preview("Empty List") {
    ContentView()
        .modelContainer(for: MarketModel.self, inMemory: true)
    
}
