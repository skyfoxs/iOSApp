//
//  TodoItem.swift
//  TodoApp
//
//  Created by Supakit Thanadittagorn on 7/7/18.
//  Copyright © 2018 pop. All rights reserved.
//

import Foundation

class TodoItem: Codable {
    var title: String
    var isDone: Bool

    init(title: String, isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }

    func toggleIsDone() {
        self.isDone = !self.isDone
    }
}
