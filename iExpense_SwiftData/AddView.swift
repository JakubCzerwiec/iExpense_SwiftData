//
//  AddView.swift
//  iExpense_SwiftData
//
//  Created by Jakub Czerwiec  on 18/11/2024.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "Add new"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Bussiness", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Save") {
                        let expens = ExpensItem(name: name, type: type, amount: amount)
                        modelContext.insert(expens)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView()
}
