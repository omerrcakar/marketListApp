//
//  EditMarketEntryView.swift
//  myMarketList
//
//  Created by ÖMER  on 14.12.2024.
//

import SwiftUI

struct EditMarketEntryView: View {
    // Model context: bridge between our app and swift data
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var editingMarketEntry: MarketEntry
    @State var editMode: Bool = false
    
    var body: some View {
        if editMode{
            VStack{
                VStack{
                    Text("🛒")
                        .font(.title)
                    Text("Edit Market Entry")
                        .foregroundStyle(.secondary)
                        .bold()
                }
                .padding(.bottom, 50)
                TextField("Market piece", text: $editingMarketEntry.title)
                HStack(spacing: 20){
                    Stepper(String(repeating: "⭐️", count: editingMarketEntry.rating), value: $editingMarketEntry.rating, in: 1...5)
                    Text("\(editingMarketEntry.rating)")
                }
                
                DatePicker("Date", selection: $editingMarketEntry.date, displayedComponents: .date)
                
                TextEditor(text: $editingMarketEntry.text)
            }
            .padding()
            .toolbar{
                Button{
                    modelContext.delete(editingMarketEntry)
                    dismiss()
                }label: {
                    Text("Delete")
                        .tint(.red)
                }
                
                
                Button{
                    editMode = false
                }label: {
                    Text("Done")
                }
            }
                
        }else{
            MarketEntryDetailView(marketEntry: editingMarketEntry)
                .toolbar{
                    Button{
                        editMode = true
                    }label: {
                        Text("Edit")
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        EditMarketEntryView(editingMarketEntry: MarketEntry(title: "Patlıcan", text: "Pazardan al", rating: 3, date: Date()))
    }
}
