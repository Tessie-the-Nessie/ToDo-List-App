//
//  ToDo_List_AppApp.swift
//  ToDo List App
//
//  Created by Tessa Delsener on 5/5/24.
//

import SwiftUI
import SwiftData

@main
struct ToDo_List_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
