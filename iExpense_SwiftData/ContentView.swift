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
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        BussinessExpView()
                    }
                    Section {
                        PrivateExpView()
                    }
                }
            }
            .navigationTitle("iExpense")

            .toolbar {
                NavigationLink {
                    AddView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


