//
//  ContentView.swift
//  iExpense_SwiftData
//
//  Created by Jakub Czerwiec  on 15/11/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpensItem]
    
    @State private var sortOrder = [
        SortDescriptor(\ExpensItem.name),
        SortDescriptor(\ExpensItem.amount)
    ]
    
    @State private var filterr = "All"
    
    var body: some View {
        NavigationStack {
            VStack {
                ExpensesView(filterr: filterr, sortOrder: sortOrder)
                    .toolbar {
                        NavigationLink {
                            AddView()
                        } label: {
                            Image(systemName: "plus")
                        }
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Sort by name")
                                    .tag([
                                        SortDescriptor(\ExpensItem.name),
                                        SortDescriptor(\ExpensItem.amount)
                                    ])
                                Text("Sort by amount")
                                    .tag([
                                        SortDescriptor(\ExpensItem.amount),
                                        SortDescriptor(\ExpensItem.name)
                                    ])
                            }
                        }
                        Menu("Filter", systemImage: "line.horizontal.3.decrease") {
                            Picker("Filter", selection: $filterr) {
                                Text("All")
                                    .tag("All")
                                Text("Personal")
                                    .tag("Bussiness")
                                Text("Bussiness")
                                    .tag("Personal")
                            }
                        }
                    }
            }
            .navigationTitle("iExpense")
        }
    }
}

#Preview {
    ContentView()
}


