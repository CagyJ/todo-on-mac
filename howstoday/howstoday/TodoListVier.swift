//
//  TodoListVier.swift
//  howstoday
//
//  Created by Cagy Jiao on 2023. 02. 09..
//

import Foundation
import SwiftUI

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var text: String
    var isComplete: Bool
}

class TodoList: ObservableObject {
    @Published var items: [TodoItem] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        self.items = loadItems()
    }
    
    private func saveItems() {
        let itemsData = try! JSONEncoder().encode(items)
        UserDefaults.standard.set(itemsData, forKey: "TodoListItems")
    }
    
    private func loadItems() -> [TodoItem] {
        if let itemsData = UserDefaults.standard.data(forKey: "TodoListItems") {
            return try! JSONDecoder().decode([TodoItem].self, from: itemsData)
        } else {
            return []
        }
    }
}

struct TodoListView: View {
    @ObservedObject var todoList = TodoList()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoList.items) { item in
                    Text(item.text)
                }
                .onDelete { indices in
                    self.todoList.items.remove(atOffsets: indices)
                }
            }
            .navigationTitle("TODO List")
            .toolbar{
                ToolbarItem(placement: .status) {
                    Button(action: addTodo) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    func addTodo() {
        todoList.items.append(TodoItem(text: "New Todo", isComplete: false))
    }
}

struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            TodoListView()
        }
    }
}

struct TodoListView_preview: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
