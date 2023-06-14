//
//  ItemCard.swift
//  ToDo List
//
//  Created by Developer Scorpio on 13/06/2023.
//

import SwiftUI

struct ItemCard: View {
    let task: TaskModel
    
    @Environment(\.modelContext) private var ctx
    @StateObject var vm = ViewModel()
    
    var body: some View {
        HStack{
            Rectangle()
                .fill(vm.randomColor.randomElement()!)
                .frame(width: 40)
                .overlay {
                    Text(task.badge)
                        .font(.system(size: 14))
                        .rotationEffect(Angle(degrees: 90))
                }
            
            VStack(alignment: .leading){
                Text(task.title)
                    .font(.headline)
                Spacer()
                Text(task.des)
                    .font(.system(size: 14))
                    .lineLimit(01)
                
            }.padding(.vertical , 20)
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("\(task.date.formatted(date: .long, time: .omitted))")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Spacer()
                Text("\(task.time.formatted(date: .omitted, time: .shortened))")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }.padding(.vertical , 20)
            
        }.frame(height: 65)
            .cornerRadius(10.0)
            .listRowSeparator(.hidden)
        
            .swipeActions(edge: .trailing, content: {
                Button {
                    SwiftDataManager.sharedInstance.deleteItem(task, ctx: ctx)
                } label: {
                    Image(systemName: "trash.fill")
                }.tint(.red)
            })
    }
}

extension ItemCard {
    class ViewModel : ObservableObject {
        @Published var randomColor : [Color] = [.purple , .pink ,.yellow ,.orange ,.cyan , .gray]
    }
}
