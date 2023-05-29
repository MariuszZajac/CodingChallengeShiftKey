//
//  ShiftCalenderView.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 29/05/2023.
//

import Foundation
import SwiftUI

struct ShiftCalendarView: View {
    @State private var currentDate = Date()
    
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(daysOfWeek(), id: \.self) { date in
                    ZStack {
                        
                        Circle()
                            .fill(isToday(date) ? Color.green : Color.clear)
                            .frame(width: 25, height: 25)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        
                        Text("\(dayOfMonth(date))")
                            .foregroundColor(isToday(date) ? .white : .black)
                            .font(.system(size: 12))
                    }
                
                    .padding(5)
                    .onTapGesture {
                        
                        // TODO: On Click  present all shifts for click day
                    }
                    .frame(width: 50)
                }
                
            }
            .alignmentGuide(.top) { _ in 0 }
        }
    }
    
    private func daysOfWeek() -> [Date] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: currentDate)
        let weekday = calendar.component(.weekday, from: today)
        let startOfWeek = calendar.date(byAdding: .day, value: 1 - weekday, to: today)!
        let endOfWeek = calendar.date(byAdding: .day, value: 7 - weekday, to: today)!
        
        return calendar.generateDates(inside: startOfWeek ... endOfWeek, matchingUnit: .day)
    }
    
    
    private func isToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date, inSameDayAs: currentDate)
    }
    private func dayOfMonth(_ date: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }
}

extension Calendar {
    func generateDates(inside interval: ClosedRange<Date>, matchingUnit: Calendar.Component) -> [Date] {
        var dates: [Date] = []
        var currentDate = interval.lowerBound
        
        while currentDate <= interval.upperBound {
            dates.append(currentDate)
            
            guard let newDate = self.date(byAdding: matchingUnit, value: 1, to: currentDate) else { break }
            currentDate = newDate
        }
        
        return dates
    }
}
struct ShiftCalenderView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftCalendarView()
    }
}
