//
//  Todo.swift
//  ToDoList
//
//  Created by Malkiel Asher on 4/28/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import Foundation

struct ToDo: Codable{
    var subject: String
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }

    static func saveToDos(_ todos: [ToDo]){
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todos").appendingPathComponent("plist")
        
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(subject: "Math", title: "Finish Assignment 1", isComplete: false, dueDate: Date(), notes: "Due In Class")
        let todo2 = ToDo(subject: "Writing", title: "Write a 2 page paper", isComplete: false, dueDate: Date(), notes: "Double Spaced")
        let todo3 = ToDo(subject: "Robotics", title: "Design a 3D model of a fight robot", isComplete: false, dueDate: Date(), notes: "Assignment is posted online")

        return [todo1,todo2,todo3]
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}


