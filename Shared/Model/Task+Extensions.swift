//
//  Task+Extensions.swift
//  AmplifyTodo (iOS)
//
//  Created by Masayuki Hiraoka on 2020/08/12.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import Foundation

extension Task: Identifiable {}
extension Task: Equatable {
    public static func ==(lhs: Task, rhs: Task) -> Bool {
        lhs.id == rhs.id
    }
}
