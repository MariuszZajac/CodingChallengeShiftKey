//
//  DateFormaterToOnlyTime.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//

import Foundation

func extractTimeFromDateTime(dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    if let date = dateFormatter.date(from: dateString) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)
        
        if let hour = components.hour, let minute = components.minute {
            let timeString = String(format: "%02d:%02d", hour, minute)
            return timeString
        }
    }
    
    return "" // Return an empty string as a default value or handle the error case accordingly
}



