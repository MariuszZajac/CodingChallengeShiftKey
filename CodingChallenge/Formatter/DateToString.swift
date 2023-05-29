//
//  DateToString.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 29/05/2023.
//

import Foundation
private func dateString(from date: Date) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
       return dateFormatter.string(from: date)
   }

