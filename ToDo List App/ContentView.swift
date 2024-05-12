//
//  ContentView.swift
//  ToDo List App
//
//  Created by Tessa Delsener on 5/5/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                
                Text("ToDo List!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                
                Spacer()
                
                Button {
                    
                    withAnimation {
                        
                        self.showNewTask = true
                    }
                    
                } label: {
                    Text("+")
                }
                .buttonBorderShape(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=shape: ButtonBorderShape@*/.circle/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                List
                {
                    ForEach(toDos) { toDoItem in
                        if toDoItem.isImportant == true {
                            Text("‼️" + toDoItem.title)
                        } else {
                            Text(toDoItem.title)
                        }
                    }
                    .onDelete(perform: deleteToDo)
                }
                
                .listStyle(.plain)
                
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            if showNewTask {
                NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
            }
            
        }
    }
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}
#Preview {
    ContentView()
}
