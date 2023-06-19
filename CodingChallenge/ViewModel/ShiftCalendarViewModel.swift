//
//  ShiftCalendarViewModel.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 19/06/2023.
//

import Foundation
import SwiftUI

class ShiftCalendarViewModel: ObservableObject {
    @Published var currentDate = Date()
    @Published var selectedDate: Date? = nil

    func daysOfWeek() -> [Date] {
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

    func isToday(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date, inSameDayAs: currentDate)
    }

    
    func dayOfMonth(_ date: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }

    
    func selectDate(_ date: Date) {
        selectedDate = date
       
    }

}
