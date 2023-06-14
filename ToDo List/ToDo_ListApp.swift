//
//  ToDo_ListApp.swift
//  ToDo List
//
//  Created by Developer Scorpio on 12/06/2023.
//

import SwiftUI
import SwiftData

@main
struct ToDo_ListApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TaskModel.self)
    }
}
