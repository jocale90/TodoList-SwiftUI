//
//  ContentView.swift
//  TodoList-SwiftUI
//
//  Created by Jose Pernia on 2025-02-03.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TodoViewModel()  // 1. Create the ViewModel

    var body: some View {
        NavigationView {
            // 2. Display your list of to-do items
            List {
                ForEach(viewModel.items) { item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button(action: {
                            viewModel.toggleCompletion(of: item)
                        }) {
                            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                // 3. Add a button to create a new item
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addNewItem) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    // MARK: - Private Functions
    private func addNewItem() {
        // You might show a text field or an alert in a real app,
        // but for now let's just add a placeholder item
        viewModel.addItem(title: "New Task")
    }

    private func deleteItems(offsets: IndexSet) {
        offsets.map { viewModel.items[$0] }
            .forEach { item in
                viewModel.deleteItem(item)
            }
    }
}


#Preview {
    ContentView()
}
