//
//  NewToDoView.swift
//  ToDo List App
//
//  Created by Tessa Delsener on 5/5/24.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    @Binding var showNewTask: Bool
    
    var body: some View {
        VStack {
            Text("Task Title")
            
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
                .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
            
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
                    .padding()
            }
            
            Button {
                addToDo()
                self.showNewTask = false            } label: {
                Text("Save")
                    .font(.callout)
                    .foregroundColor(Color.red)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        
    }
}
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

    let toDo = ToDoItem(title: "Example ToDo", isImportant: false)
    return NewToDoView(toDoItem: toDo, showNewTask: .constant(true))
        .modelContainer(container)
}
