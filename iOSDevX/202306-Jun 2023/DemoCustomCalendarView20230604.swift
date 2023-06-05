//
//  DemoCustomCalendarView20230604.swift
//  iOSDevX
//
//  Created by Xavier on 6/4/23.
//

import SwiftUI

struct DemoCustomCalendarView20230604: View {
    var body: some View {
        ContentView()
    }
    struct ContentView: View {
        @State private var month = 1
        @State private var year = 1970
        @State private var selectedDate = Date()
        let skyblue: Color = .init(red: 118/255, green: 169/255, blue: 255/255)
        let crimson: Color = .init(red: 233/255, green: 28/255, blue: 76/255)
        let calendar = Calendar.current
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "d"
            return formatter
        }()

        var body: some View {
            VStack {
                HStack {
                    // title
                    Spacer()
                    Text("\(calendar.monthSymbols[month - 1]) \(String(year))")
                        .font(.title)
                        .fontDesign(.monospaced)
                    Spacer()
                    Button {
                        showToday()
                    } label: {
                        Text("Today")
                            .bold()
                    }

                }
                HStack(spacing: 2) {
                    Image(systemName: "chevron.backward.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.secondary)
                        .frame(width: 35, height: 35)
                        .onTapGesture {
                            if month == 1 {
                                month = 12
                                year -= 1
                            } else {
                                month -= 1
                            }
                        }
                    // calendar month view
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 10) {
                        Group {
                            Text("SUN")
                            Text("MON")
                            Text("TUE")
                            Text("WED")
                            Text("THU")
                            Text("FRI")
                            Text("SAT")
                        }
                        .bold()
                        .foregroundColor(.secondary)
                        .fontDesign(.monospaced)
                        
                        ForEach(getCalendarDays(), id: \.self) { date in
                            ZStack {
                                // show crimson circle for today
                                if isSameDay(date, Date()) {
                                    Circle().stroke(lineWidth: 2).foregroundColor(crimson)
                                } else {
                                    Circle().stroke(lineWidth: isSameDay(selectedDate, date) ? 2 : 0).foregroundColor(skyblue)
                                }
                                
                                // show date number on the top
                                Text("\(Int(dateFormatter.string(from: date))!)")
                                    .bold()
                                    .fontDesign(.monospaced)
                                    .foregroundColor(isInSelectedMonth(date: date) ? .primary : .secondary)
                                // transparent circle for padding
                                Circle()
                                    .frame(width: 35, height: 35, alignment: .center)
                                    .foregroundColor(.clear)
                                
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedDate = date
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation {
                                        selectedDate = Date()
                                    }
                                }
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width*0.8)
                    Image(systemName: "chevron.forward.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.secondary)
                        .frame(width: 35, height: 35)
                        .onTapGesture {
                            if month == 12 {
                                month = 1
                                year += 1
                            } else {
                                month += 1
                            }
                        }
                    
                }
                .padding(.horizontal, 20)
            }
            .padding()
            .onAppear {
                showToday()
            }
        }

        //MARK: - View Controller
        /// Show Today
        /// Updates the states "month" and "year" to current time. Invoked when the user taps on "Today" button and inside onAppear.
        func showToday() {
            year = calendar.component(.year, from: Date())
            month = calendar.component(.month, from: Date())
        }
        func getCalendarDays() -> [Date] {
            let startDate = calendar.date(from: DateComponents(year: year, month: month))!
            return getDays(for: startDate)
        }
        
        /// isInSelectedMonth
        /// - Parameter date: an instance of Date presented in the view.
        /// - Returns: a boolean value that indicates if the selected date is in the month of the states "month" and "year".
        func isInSelectedMonth(date: Date) -> Bool {
            let components = calendar.dateComponents([.year, .month], from: date)
            return components.month == month && components.year == year
        }
        //MARK: - Calendar Functions
        
        /// getDatesInMonth
        /// - Parameters:
        ///   - dateInterval: a date interval that represents the range of days to fetch
        ///   - dateComponent: components of date instances to return. when invoked, pass 0 for hour, minute and second.
        /// - Returns: an array of date instances that falls within the range represented by the date interval argument.
        func getDaysInRange(
            dateInterval: DateInterval,
            dateComponent: DateComponents) -> [Date] {
            
            var dates: [Date] = []
            dates.append(dateInterval.start)
            
                calendar.enumerateDates(startingAfter: dateInterval.start, matching: dateComponent, matchingPolicy: .nextTime) { date, _, stop in
                guard let date = date else {
                    return
                }
                
                if date < dateInterval.end { dates.append(date) } else {
                    stop = true //inout
                }
            }
            return dates
        }
        
        // get all dates of a month + ending days from last month + startings days from next month
        /// getDays
        /// - Parameter month: a date instance to represent a month
        /// - Returns: an array of date instances of the days in the month of month arugment, together with the endings days of the last month and starting days of the previous month, provided they fall in a same week of the first and last day of the month respectively.
        func getDays(for month: Date) -> [Date] {
            guard
                let monthInterval = calendar.dateInterval(of: .month, for: month),
                let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
                let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end)
            else { return [] }
            return self.getDaysInRange(
                dateInterval: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
                dateComponent: DateComponents(hour: 0, minute: 0, second: 0)
            )
        }
        //MARK: - Date Functions
        
        /// isSameDay
        /// - Parameters:
        ///   - date1: a date instance
        ///   - date2: a date instance to validate against
        /// - Returns: a boolean value that indicate if the two date arguments are in the same day.
        func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
            let components: Set<Calendar.Component> = [.year, .month, .day]
            return calendar.dateComponents(components, from: date1) == calendar.dateComponents(components, from: date2)
        }
    }
}

struct DemoCustomCalendarView20230604_Previews: PreviewProvider {
    static var previews: some View {
        DemoCustomCalendarView20230604()
    }
}
