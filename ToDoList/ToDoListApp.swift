//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Perennial Macbook on 17/02/22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var taskViewModel : TaskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TaskList()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(taskViewModel)
        }
    }
}
