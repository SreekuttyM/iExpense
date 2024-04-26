//
//  SecondView.swift
//  iExpense
//
//  Created by Sreekutty Maya on 25/04/2024.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        
        NavigationStack {
            Button("Dismiss") {
                dismiss()
            }
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }.onDelete(perform: removeRows)
                    
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }.toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    SecondView()
}
