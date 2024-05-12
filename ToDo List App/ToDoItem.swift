//
//  ToDoItem.swift
//  ToDo List App
//
//  Created by Tessa Delsener on 5/12/24.
//

import Foundation
import SwiftData

@Model
class ToDoItem {
    var title: String
    var isImportant: Bool
    
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}
