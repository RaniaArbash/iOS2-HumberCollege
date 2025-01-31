//
//  EditTaskView.swift
//  Week2
//
//  Created by Rania Arbash on 2025-01-31.
//

import SwiftUI

struct EditTaskView: View {
    var taskToEdit : Task
    var onUpdate : (String)->Void
    
    @State private var editedTask : String = ""
    @Environment(\.dismiss) var dismiss
    init(taskToEdit: Task, onUpdate: @escaping (String) -> Void) {
        self.taskToEdit = taskToEdit
        self.onUpdate = onUpdate
        self._editedTask = State(initialValue: taskToEdit.name)
    }
    
    var body: some View {
        TextField("Update The Task", text: $editedTask)
        Button {
            onUpdate(editedTask)
            dismiss()
        } label: {
            Text("Save and Close")
        }

    }
}

