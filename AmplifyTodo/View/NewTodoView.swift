//
//  NewTodoView.swift
//  AmplifyTodo
//
//  Created by hiraoka on 2020/08/10.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import SwiftUI

struct NewTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
            Text("Enter a new Todo")
                .font(.largeTitle)
            
            TextEditor(text: $text)
                .padding(.horizontal)
            
            Button(action: saveTodo,
                   label: {
                    Text("Save")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                })
            
            Spacer().frame(height: 30)
        }
    }
    
    func saveTodo() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView()
    }
}
