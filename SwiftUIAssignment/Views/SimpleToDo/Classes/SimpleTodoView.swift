//
//  SimpleTodoView.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 02/06/22.
//

import SwiftUI

struct SimpleTodoView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) private var tasks: FetchedResults<Task>
    
    @State private var taskTitle: String = ""
    
    var body: some View {
        VStack {
            Text("Tasks")
                .font(.title)
              
            TextField("Task", text: $taskTitle)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Button {
                //CoreData entity class
                let task = Task(context: viewContext)
                task.title = taskTitle
                
                do {
                    try viewContext.save()
                } catch {
                    print("Error in saving task")
                }
                
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            tasksList

        }
        .padding()
    }
    
    var tasksList: some View {
        List(tasks) { aTask in
            Text(aTask.title ?? "")
        }
    }
}

struct SimpleTodoView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTodoView()
    }
}
