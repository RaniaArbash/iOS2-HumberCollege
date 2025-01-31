//
//  Model.swift
//  Week2
//
//  Created by Rania Arbash on 2025-01-17.
//

import Foundation

class Task : ObservableObject, Identifiable {
    let id = UUID()
    @Published  var name: String
    @Published var isCompleted: Bool
    
    init(name: String, isCompleted: Bool) {
        self.name = name
        self.isCompleted = isCompleted
    }
}
// MVC
// MVVM
class TaskViewModel : ObservableObject {
    @Published var tasks : [Task] = [
        Task(name: "Buy Milk", isCompleted: true),
        Task(name: "Call Mam", isCompleted: false),
        Task(name: "Finish This App", isCompleted: false)
    ]
    
    func addNewTask(name: String, isCompleted:Bool){
        tasks.append(Task(name: name, isCompleted: isCompleted))
    }
    
    func removeOneTask(taskindex: Int){
        tasks.remove(at: taskindex)
    }
    
    func updateOneTask(taskToUpdate: Task, newTask: String ){
        taskToUpdate.name = newTask
        var index = tasks.firstIndex { t in
            t.id == taskToUpdate.id
        }
        if let goodIndex = index {
            tasks[goodIndex] = taskToUpdate
        }
    }
    
    
    
    
}




