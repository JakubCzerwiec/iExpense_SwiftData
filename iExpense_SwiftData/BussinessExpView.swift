//
//  BussinessExpView.swift
//  iExpense_SwiftData
//
//  Created by Jakub Czerwiec  on 20/11/2024.
//

import SwiftData
import SwiftUI

struct BussinessExpView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpensItem]

    var body: some View {
            ForEach(expenses, id: \.id) { expens in
                if expens.type == "Bussiness" {
                    HStack{
                        VStack(alignment: .leading) {
                            Text(expens.name)
                            Text(expens.type)
                        }
                        Spacer()
                        Text(expens.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundColor(expens.amount < 20 ? .green : expens.amount > 90 ? .red : .orange)
                    }
                }
            }
            .onDelete(perform: removeExpense)
    }
    func removeExpense(indexSet: IndexSet) {
        indexSet.forEach {index in
            let expense = expenses[index]
            modelContext.delete(expense)
        }
    }
}

#Preview {
    BussinessExpView()
}
