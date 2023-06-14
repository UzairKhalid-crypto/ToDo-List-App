//
//  TaskModel.swift
//  ToDo List
//
//  Created by Developer Scorpio on 13/06/2023.
//

import Foundation
import SwiftData

@Model
class TaskModel {
    let title : String
    let des : String
    let badge : String
    let date : Date
    let time : Date
    
    init(title: String, des: String, badge: String, date: Date, time: Date) {
        self.title = title
        self.des = des
        self.badge = badge
        self.date = date
        self.time = time
    }
    
}
