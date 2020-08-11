//
//  NewTodoView.swift
//  AmplifyTodo
//
//  Created by hiraoka on 2020/08/10.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import SwiftUI
import Amplify

struct NewTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
            Text("Enter a new Todo")
                .font(.largeTitle)
            
            TextEditor(text: $text)
                .padding(.horizontal)
            
            Button(action: saveTodo) {
                Text("Save")
                    .font(.title)
                    .frame(width: 100, height: 45, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Spacer().frame(height: 30)
        }
    }
    
    func saveTodo() {
        let task = Task(title: text, completed: false)
        
        Amplify.DataStore.save(task) { (relust: Result<Task, DataStoreError>) in
           if case .failure(let error) = relust {
               print(error)
           }
       }
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView()
    }
}
