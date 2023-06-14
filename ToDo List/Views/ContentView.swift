//
//  ContentView.swift
//  ToDo List
//
//  Created by Developer Scorpio on 12/06/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(FetchDescriptor(
        sortBy: [SortDescriptor(\.date, order: .reverse)]
    ), animation: .snappy) private var tasks : [TaskModel]
    
    @State var openSheet : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    ItemCard(task: task)
                }
            }.listStyle(.plain)
                .navigationTitle("Todo List")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            openSheet.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $openSheet) {
                    SheetView()
                }
        }
    }
}

#Preview {
    ContentView()
}



