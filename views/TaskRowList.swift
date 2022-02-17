//
//  ListRowView.swift
//  ToDoList
//
//  Created by Perennial Macbook on 17/02/22.
//

import SwiftUI


struct TaskRowList: View {
    let task : TaskModel

    var body: some View {
         HStack {
            Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                .foregroundColor(task.isCompleted ? .blue : .red)
            Text(task.title)
            Spacer()
             
             Text(task.decs)
                 .font(.body)
                 .fontWeight(.regular)
        }
        .font(.title2)
        .padding(.vertical, 5)
    }
}

struct TaskRowList_Previews: PreviewProvider {
    static var item1 = TaskModel(title: "First item!", decs: "task decs",isCompleted: false)
    static var item2 = TaskModel(title: "Second Item.",decs: "2nd task decs", isCompleted: true)
    
    static var previews: some View {
        Group {
            TaskRowList(task: item1)
            TaskRowList(task: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
