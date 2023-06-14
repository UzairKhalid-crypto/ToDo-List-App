//
//  SwiftDataManager.swift
//  ToDo List
//
//  Created by Developer Scorpio on 13/06/2023.
//
import Foundation
import SwiftData

class SwiftDataManager {
    static let sharedInstance = SwiftDataManager()
    
    public func addItem(title: String, description: String, badge: String, date: Date, time: Date, ctx: ModelContext) {
        if !title.isEmpty && !description.isEmpty {
            let task = TaskModel(
                title: title,
                des: description,
                badge: badge,
                date: date,
                time: time)
            ctx.insert(task)
            do{
                try ctx.save()
            }catch{
                print(error.localizedDescription)
            }
            
        }else{
            print("Fill All the Fields....")
        }
    }

    public func deleteItem(_ task: TaskModel, ctx: ModelContext) {
        ctx.delete(task)
        try? ctx.save()
    }
}
