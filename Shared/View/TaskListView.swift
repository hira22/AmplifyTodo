//
//  TaskListView.swift
//  AmplifyTodo
//
//  Created by hiraoka on 2020/08/10.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import SwiftUI
import Amplify
import Combine

struct TaskListView: View {
    
    @State var tasks = [Task]()
    
    @State var showNew: Bool = false
    
    @State var observationToken: AnyCancellable?

    init() {

    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(tasks) { task in
                        Text(task.title)
                    }.onDelete(perform: onDelete)
                }
                
                VStack {
                    Spacer()
                    Button(action: { showNew.toggle() }) {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    Spacer().frame(height: 30)
                }
            }
            .navigationBarTitle("Todos")
            .sheet(isPresented: $showNew, content: {
                NewTodoView()
            }).onAppear {
                fetchList()
                observeList()
            }
        }
    }
    
    func fetchList() {
        Amplify.DataStore.query(Task.self) { (result: Result<[Task], DataStoreError>) in
            switch result {

            case .success(let tasks):
                self.tasks = tasks
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func observeList() {
        observationToken = Amplify.DataStore.publisher(for: Task.self).sink { (completion: Subscribers.Completion<DataStoreError>) in
            if case .failure(let error) = completion { print(error) }
        } receiveValue: { (event: MutationEvent) in
            
            guard let task = try? event.decodeModel(as: Task.self) else { return }
            
            switch event.mutationType {
            case "create":
                self.tasks.append(task)
                
            case "delete":
                if let index = self.tasks.firstIndex(of: task) {
                    self.tasks.remove(at: index)
                }
            default:
                break
            }
        }

    }
    
    func onDelete(at indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        
        
        
        Amplify.DataStore.delete(tasks[index]) { (relust: DataStoreResult<Void>) in
            if case .failure(let error) = relust {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
