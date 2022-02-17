//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Perennial Macbook on 17/02/22.
//

import Foundation

class TaskViewModel : ObservableObject {
    @Published var items : [TaskModel] = [] {
        didSet {
            saveItem()
        }
    }
    let task_key: String = "task_list"
    init(){
        getTask()
    }
    
    func getTask(){
        guard
            let data = UserDefaults.standard.data(forKey: task_key),
            let saveItems = try? JSONDecoder().decode([TaskModel].self, from: data)
        else {return}
        
        self.items = saveItems
    }
    
    func addTask(title : String, decs : String){
        let newTask = TaskModel(title: title,decs: decs, isCompleted: false)
        items.append(newTask)
    }
    
    func deleteTask(position : IndexSet){
        items.remove(atOffsets: position)
    }
    
    func moveTask(from : IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }

    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: task_key)
        }
    }
    
    func UpdateTask(item : TaskModel) {
        if let position = items.firstIndex(where: {$0.id == item.id}){
            items[position] = item.checkIsCompleted()
        }
    }
}
