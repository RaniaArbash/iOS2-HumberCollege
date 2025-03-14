//
//  TaskViewModel.swift
//  ToDoApp_Week9
//
//  Created by Rania Arbash on 2025-03-14.
//

import Foundation
import CoreData


class TaskViewModel : ObservableObject{
    @Published var tasks : [Task] = []
    @Published var searchTerm = ""
    @Published var newTaskText = ""
    
    private var viewContext : NSManagedObjectContext
    
    init() {
        self.viewContext = PersistenceController.shared.container.viewContext
        fetchTasks()
    }
    
    // List of tasks
    
    // Fetch List of task from coredata
    // Select * from Task order by task.date
    
    func fetchTasks(){
        let request : NSFetchRequest<Task> = Task.fetchRequest()// select * from Task
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Task.date, ascending: true)]
        do {
            tasks = try viewContext.fetch(request)
        }catch {
            print(error)
        }
    }
    
    // Fetch List of tasks start with spcific value
    // Select * from Task where task.name contains "search term"
    
    func SearchForTasks(){
        let request : NSFetchRequest<Task> = Task.fetchRequest()// select * from Task
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Task.date, ascending: true)]
        request.predicate = NSPredicate(format: "name CONTAINS[c] %@", searchTerm)
        do {
            tasks = try viewContext.fetch(request)
        }catch {
            print(error)
        }
    }
    
    // delete one task from core data
    // save the context
    func deleteOneTask(offset: IndexSet){
        offset.map{tasks[$0]}.forEach(viewContext.delete)
        do{
            try viewContext.save()
            fetchTasks()
        }
        catch {
            print(error)
        }
    }
    
    // add new task to core data
    // save the context
    func addNewTask(){
        if !newTaskText.isEmpty {
            var newTask = Task(context: viewContext)
            newTask.id = UUID()
            newTask.name = newTaskText
            newTask.date = Date()
            newTaskText = ""
            do{
                try viewContext.save()
                fetchTasks()
            }
            catch {
                print(error)
            }
        }
    }
    
    
}
