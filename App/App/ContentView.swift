//
//  ContentView.swift
//  App
//
//  Created by Allison Roth on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("My To Do List")
        TextField("Enter Task", text: $taskText)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        Button(action: {
            if !taskText.isEmpty {
                tasks.append(taskText)
                taskText = ""
            }
        }) {
            Text("Add Task")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        NavigationView {
            List {
                ForEach(tasks, id: \.self) { task in
                    Text(task)
                }
                .onDelete { indexSet in
                    tasks.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("My To Do List")
            .toolbar {
                EditButton()
            }
        }
    }
    @State private var taskText: String = ""
    @State private var tasks: [String] = []
}

#Preview {
    ContentView()
}
