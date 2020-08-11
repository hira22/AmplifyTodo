//
//  AmplifyTodoApp.swift
//  Shared
//
//  Created by Masayuki Hiraoka on 2020/08/10.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import SwiftUI
import Amplify
import AmplifyPlugins

@main
struct AmplifyTodoApp: App {
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
    
    private func configureAmplify() {
        try! Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: AmplifyModels()))
        try! Amplify.configure()
    }
}
