//
//  TaskView.swift
//  howstoday
//
//  Created by Cagy Jiao on 2023. 02. 09..
//

import Foundation
import SwiftUI

struct TaskView: View {
    let task: Task
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Button(action: { () in self.completeTask(task: task)} ) {
                Image(systemName: task.completed ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.secondary)
                    .frame(width: 25)
            }
            .buttonStyle(PlainButtonStyle())
            Button(action: editTask) {
                Text(task.title)
                    .strikethrough(task.completed)
                    .foregroundColor(task.completed ? .secondary : .primary)
            }
            .buttonStyle(PlainButtonStyle())
            Spacer()
        }

    }
    
    func completeTask(task: Task) {
        print("Delete")
    }
    
    func editTask() {
        print("Edit")
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        let testTask = Task(title: "Test", completed: false, deleted: false, date: Date())
        
        return TaskView(task: testTask)
    }
}
