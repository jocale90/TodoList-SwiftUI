//
//  TodoViewModel.swift
//  TodoList-SwiftUI
//
//  Created by Jose Pernia on 2025-02-03.
//

import SwiftUI

class TodoViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var items: [TodoItem] = []

    // MARK: - Init
    init() {
        // (Optional) Start with some sample data
        items = [
            TodoItem(title: "Buy groceries", isCompleted: false),
            TodoItem(title: "Learn SwiftUI", isCompleted: false)
        ]
    }

    // MARK: - CRUD Methods
    func addItem(title: String) {
        let newItem = TodoItem(title: title, isCompleted: false)
        items.append(newItem)
    }

    func deleteItem(_ item: TodoItem) {
        items.removeAll { $0.id == item.id }
    }

    func toggleCompletion(of item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
}

