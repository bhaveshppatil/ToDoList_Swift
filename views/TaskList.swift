//
//  ListView.swift
//  ToDoList
//
//  Created by Perennial Macbook on 17/02/22.
//

import SwiftUI
struct TaskList : View{
@EnvironmentObject var taskViewModel : TaskViewModel

    var body: some View {
        ZStack{
            if taskViewModel.items.isEmpty {
                EmptyTaskList()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            } else{
                List {
                    ForEach(taskViewModel.items){ item in
                        TaskRowList(task: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    taskViewModel.UpdateTask(item: item)
                                }
                            }
                    }
                    .onDelete(perform: taskViewModel.deleteTask)
                    .onMove(perform: taskViewModel.moveTask)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Task List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:  NavigationLink("Add",  destination: AddTask()))
    
    }
}

struct TaskList_previews : PreviewProvider{
    static var previews: some View{
        NavigationView{
            TaskList()
        }
        .environmentObject(TaskViewModel())
    }
}
