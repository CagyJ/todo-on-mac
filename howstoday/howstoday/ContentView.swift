//
//  ContentView.swift
//  howstoday
//
//  Created by Cagy Jiao on 2023. 02. 08..
//

import SwiftUI

struct Option: Hashable {
    let id: Int
    let title: String
    let imageName: String
}

struct Task: Hashable {
    let title: String
    let completed: Bool
    let deleted: Bool
    let date: Date
}

struct ContentView: View {
    @State var currentSelection = 1
    let options: [Option] = [
        .init(id: 1, title: "Today", imageName: "star.fill"),
        .init(id: 2, title: "All", imageName: "largecircle.fill.circle"),
        .init(id: 3, title: "Trash", imageName: "trash.fill"),
        .init(id: 4, title: "New List", imageName: "plus"),
        .init(id: 9, title: "About", imageName: "info.circle.fill"),
    ]
    
    @State var tasks: [Task] = [
        .init(title: "Test1", completed: true, deleted: false, date: Date()),
        .init(title: "Test2", completed: false, deleted: false, date: Date()),
        .init(title: "Test3", completed: false, deleted: true, date: Date()),
    ]
    
    var body: some View {
        NavigationView{
            SideBarView(
                options: options,
                currentSelection: $currentSelection
            )
    
            switch currentSelection {
            case 9:
                Text("About")
            default:
                MainView(tasks: $tasks)
            }
        }
        .frame(minWidth: 600, minHeight: 800)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
