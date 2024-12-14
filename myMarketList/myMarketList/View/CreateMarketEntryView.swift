//
//  MarketEntryView.swift
//  myMarketList
//
//  Created by ÖMER  on 14.12.2024.
//

import SwiftUI

struct CreateMarketEntryView: View {
    
    // Model context: bridge between our app and swift data
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var text: String = "Market piece description or place..."
    @State var rating: Int = 1
    @State var date: Date = Date()
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack{
                    Text("🛒")
                        .font(.title)
                    Text("Create Market Entry")
                        .foregroundStyle(.secondary)
                        .bold()
                }
                .padding(.bottom, 50)
                TextField("Market piece", text: $title)
                HStack(spacing: 20){
                    Stepper(String(repeating: "⭐️", count: rating), value: $rating, in: 1...5)
                    Text("\(rating)")
                }
                
                DatePicker("Date", selection: $date, displayedComponents: .date)
                
                TextEditor(text: $text)
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        modelContext.insert(MarketEntry(title: title, text: text, rating: rating, date: date))
                        title = ""
                        text = ""
                        rating = 1
                        dismiss()
                    }label: {
                        Text("Save")
                            .tint(.blue)
                            .bold()
                    }
                    
                }
                
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                            .bold()
                    }
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    CreateMarketEntryView()
}
