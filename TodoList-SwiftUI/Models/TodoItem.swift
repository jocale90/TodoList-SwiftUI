//
//  TodoItem.swift
//  TodoList-SwiftUI
//
//  Created by Jose Pernia on 2025-02-03.
//

import Foundation

struct TodoItem: Identifiable, Equatable, Hashable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}
