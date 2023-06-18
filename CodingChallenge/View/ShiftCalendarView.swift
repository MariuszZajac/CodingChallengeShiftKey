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
    @State private var selectedDate: Date? = nil

    var body: some View {
        VStack (alignment: .leading) {
            LazyHStack(alignment: .center, spacing: 2) {
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
                        selectedDate = date // Aktualizacja wybranej daty po kliknięciu
                    }
                }
            }
            .frame(width: 350, height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            if let selectedDate = selectedDate {

            }
        }
    }
    

    
    private func daysOfWeek() -> [Date] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: currentDate)
        let startOfWeek = calendar.date(byAdding: .day, value: -3, to: today)!
        let endOfWeek = calendar.date(byAdding: .day, value: 3, to: today)!

        var days = [Date]()
        var currentDate = startOfWeek

        while currentDate <= endOfWeek {
            days.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }

        return days
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
