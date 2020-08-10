//
//  TodoListView.swift
//  AmplifyTodo
//
//  Created by hiraoka on 2020/08/10.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    
    @State var todos = Array(0..<100).map { _ in UUID().uuidString }
    
    @State var showNew: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todos, id: \.self) { todo in
                        Text(todo)
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
            })
        }
    }
    
    func onDelete(at indexSet: IndexSet) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
