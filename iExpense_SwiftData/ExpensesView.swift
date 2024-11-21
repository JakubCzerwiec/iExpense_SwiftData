//
//  ExpensesView.swift
//  iExpense_SwiftData
//
//  Created by Jakub Czerwiec  on 20/11/2024.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpensItem]
    

    var body: some View {
        List {
            Section {
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
            Section {
                ForEach(expenses, id: \.id) { expens in
                    if expens.type == "Personal" {
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
        }
    }
    
    init(filterr: String ,sortOrder: [SortDescriptor<ExpensItem>]) {
        _expenses = Query(filter: #Predicate<ExpensItem> { expens in
            expens.type != filterr
        }, sort: sortOrder)
    }
    
    func removeExpense(indexSet: IndexSet) {
        indexSet.forEach {index in
            let expense = expenses[index]
            modelContext.delete(expense)
        }
    }
}


#Preview {
    ExpensesView(filterr: "Bussiness" ,sortOrder: [SortDescriptor(\ExpensItem.name)])
}
