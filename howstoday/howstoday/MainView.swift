//
//  MainView.swift
//  howstoday
//
//  Created by Cagy Jiao on 2023. 02. 09..
//

import Foundation
import SwiftUI

struct MainView: View {
    @Binding var tasks: [Task]
    
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 12) {
                Text("Tasks")
                    .font(.headline)
                
                ForEach(tasks, id: \.self) { task in
                    TaskView(task: task)
                }
            }
        }
        .navigationTitle("Todo")
        .toolbar {
            ToolbarItem(placement: .status) {
                Button(action: {tasks.append(Task(title: "new", completed: false, deleted: false, date: Date()))}) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
