//
//  ContentView-DemoSortOptions20230320.swift
//  iOSDevX
//
//  Created by Xavier on 3/20/23.
//


import SwiftUI

struct ContentView_DemoSortOptions20230320: View {
    //MARK: - Model
    struct Task: Identifiable, Hashable {
        let id = UUID()
        let name: String
        let dueDate: Date
        let priority: Priority
        
        enum Priority: Int {
            case low, medium, high
        }
    }
    //MARK: - Sample Data
    @State var tasks: [Task] = []
    func getTasks() {
        tasks = [
            .init(name: "Task1", dueDate: stringToDate("2021/02/11"), priority: .low),
            .init(name: "Task2", dueDate: stringToDate("2021/02/11"), priority: .high),
            .init(name: "Task3", dueDate: stringToDate("2022/02/11"), priority: .medium),
            .init(name: "Task4", dueDate: stringToDate("2022/02/11"), priority: .high),
            .init(name: "Task5", dueDate: stringToDate("2022/02/10"), priority: .low),
            .init(name: "Task6", dueDate: stringToDate("2022/07/10"), priority: .low),
            .init(name: "Task7", dueDate: stringToDate("2022/07/10"), priority: .high),
            .init(name: "Task8", dueDate: stringToDate("2021/11/10"), priority: .low),
            .init(name: "Task9", dueDate: stringToDate("2021/11/10"), priority: .medium)
        ]
    }
    //MARK: - Utility Function
    func stringToDate(_ str: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.date(from: str) ?? Date()
    }
    
    //MARK: - Option Enum
    enum SortOption {
        case name, dueDate, priority
    }
    
    //MARK: - View Properties
    @State private var sortOption: SortOption = .name
    var sortedTasks: [Task] {
        switch sortOption {
        case .name:
            return tasks.sorted { $0.name < $1.name }
        case .dueDate:
            return tasks.sorted { $0.dueDate < $1.dueDate }
        case .priority:
            return tasks.sorted { $0.priority.rawValue > $1.priority.rawValue }
        }
    }
    //MARK: - View Body
    var body: some View {
        VStack {
            Picker("Sort By", selection: $sortOption) {
                Text("Name").tag(SortOption.name)
                Text("Due Date").tag(SortOption.dueDate)
                Text("Priority").tag(SortOption.priority)
            }.pickerStyle(SegmentedPickerStyle())
            
            ScrollView {
                ForEach(sortedTasks) { task in
                    Divider()
                    HStack {
                        Text(task.name).bold()
                        Spacer()
                        Text("\(task.dueDate.formatted(date: .abbreviated, time: .omitted))")
                        Text("\(task.priority.rawValue)")
                    }
                }
            }
            .padding(.horizontal, 15)
        }
        .onAppear {
            getTasks()
        }
    }
}
//MARK: - Preview
struct ContentView_DemoSortOptions20230320_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView_DemoSortOptions20230320()
                .navigationTitle("Task List")
        }
    }
}

