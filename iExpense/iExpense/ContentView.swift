//
//  ContentView.swift
//  iExpense
//
//  Created by Sreekutty Maya on 25/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var expenses  = Expenses()
    @State private var showingAddExpense = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }.onDelete(perform: removeItems)
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }.sheet(isPresented: $showingAddExpense) {
                // show an AddView here
                AddView(expenses: expenses)

            }.navigationTitle("iExpense")
                .toolbar  {
                    Button("Add Expense", systemImage: "plus") {
                        let expense = ExpenseItem(name: "Aby", purpose: "Personal", cost: 20.0)
                        expenses.items.append(expense)
                    }
                }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
