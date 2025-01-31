//
//  TaskListView.swift
//  Week2
//
//  Created by Rania Arbash on 2025-01-17.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var taskViewModel = TaskViewModel()
    
    @State private var userInput : String = ""

    var body: some View {
        NavigationStack{
            VStack{
                
                HStack{
                    TextField("New Task", text: $userInput).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                    
                    Button(action: {
                        taskViewModel.addNewTask(name: userInput, isCompleted: false)
                    }){
                        Image(systemName: "plus").foregroundColor(.white).padding().background(Color.blue).clipShape(Circle())
                    }
                }
                List{
                    ForEach(taskViewModel.tasks){
                        task in
                        NavigationLink {
                            EditTaskView(taskToEdit: task) { newName in
                                taskViewModel.updateOneTask(taskToUpdate: task, newTask: newName)
                            }
                        } label: {
                            HStack{
                                Text(task.name).strikethrough(task.isCompleted)
                                Spacer()
                                Toggle("", isOn: $taskViewModel.tasks[taskViewModel.tasks.firstIndex(where: { $0.id == task.id })!].isCompleted)
                                
                                
                            }
                        }
                    }
                }
            }
        }.navigationTitle("Tasks App")
    }
}

#Preview {
    TaskListView()
}
