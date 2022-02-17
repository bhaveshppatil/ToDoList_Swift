//
//  TaskModel.swift
//  ToDoList
//
//  Created by Perennial Macbook on 17/02/22.
//

import Foundation

struct TaskModel : Identifiable, Codable {
    let id : String
    let title : String
    let decs : String
    let isCompleted : Bool
    
    init(id : String = UUID().uuidString, title: String, decs : String, isCompleted : Bool){
        self.id = id
        self.title = title
        self.decs = decs
        self.isCompleted = isCompleted
    }
    
    func checkIsCompleted() -> TaskModel {
        return TaskModel(id: id, title: title,decs: decs, isCompleted: isCompleted)
    }
}
