//
//  ContentView.swift
//  ToDoApp_Week9
//
//  Created by Rania Arbash on 2025-03-14.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @StateObject var taskViewModel = TaskViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                TextField("Search For Tasks", text: $taskViewModel.searchTerm).padding().textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: taskViewModel.searchTerm) {
                        if taskViewModel.searchTerm == "" {
                            taskViewModel.fetchTasks()
                        }else {
                            taskViewModel.SearchForTasks()
                        }
                    }
                HStack{
                    TextField("Enter New Task", text: $taskViewModel.newTaskText ).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                    Button(action: taskViewModel.addNewTask) {
                        Image(systemName: "plus").padding().background(Color.blue).foregroundColor(Color.white).clipShape(Circle())
                    }
                }
                List {
                    ForEach(taskViewModel.tasks) { task in
                        HStack{
                            Text(task.name ?? "No Task")
                            Spacer()
                            if let taskTime = task.date{
                                Text(taskTime, style: .date)
                            }
                        }
                    }
                    .onDelete(perform: taskViewModel.deleteOneTask)
                }.navigationTitle("My Tasks")
                
            }
        }
    }
    
    
    
}
