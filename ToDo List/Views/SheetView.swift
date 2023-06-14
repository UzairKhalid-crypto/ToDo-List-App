//
//  SheetView.swift
//  ToDo List
//
//  Created by Developer Scorpio on 13/06/2023.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.modelContext) private var ctx
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            HStack{
                Text("Add Item")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button("Done"){
                    doneAction()
                }
            }.padding(.top)
            
            DatePicker(
                "Start Date",
                selection: $vm.date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.compact)
            .padding(.top)
            .font(.headline)
            
            DatePicker(
                "Time",
                selection: $vm.time,
                displayedComponents: [.hourAndMinute]
            )
            .datePickerStyle(.compact)
            .padding(.top)
            .font(.headline)
            
            TitleHeader("Badge")
            Picker("Please choose a badge", selection: $vm.badge) {
                ForEach(vm.badgeList, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(.segmented)
                .font(.headline)
            
            TitleHeader("Title")
            TextField("Add Title here...", text: $vm.title)
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(.gray.opacity(0.1))
                }
            
            
            TitleHeader("Description")
            TextField("Add Description here...", text: $vm.description, axis: .vertical)
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(.gray.opacity(0.1))
                }
            
            Spacer()
        }.padding()
        
    }
    
    @ViewBuilder func TitleHeader(_ text: String) -> some View{
        HStack{
            Text(text)
                .font(.headline)
            Spacer()
        }.padding(.top)
    }
    
    func doneAction() {
        SwiftDataManager.sharedInstance.addItem(
            title: vm.title,
            description: vm.description,
            badge: vm.badge,
            date: vm.date,
            time: vm.time,
            ctx: ctx
        )
        dismiss()
    }
    
}

#Preview {
    SheetView()
}

extension SheetView {
    class ViewModel: ObservableObject{
        @Published var title : String = ""
        @Published var description : String = ""
        @Published var badge : String = "Fun"
        @Published var date : Date = Date()
        @Published var time : Date = Date()
        @Published var badgeList = ["Birth", "Family", "Work", "Fun", "Sport", "Other"]
    }
}
