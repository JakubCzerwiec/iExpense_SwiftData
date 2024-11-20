//
//  iExpense_SwiftDataApp.swift
//  iExpense_SwiftData
//
//  Created by Jakub Czerwiec  on 15/11/2024.
//

import SwiftData
import SwiftUI

@main
struct iExpnce2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [ExpensItem.self])
    }
}
