//
//  DateFormatterHelper.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 26/05/2023.
//

import Foundation

func createISO8601DateFormatter() -> ISO8601DateFormatter {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    // Add any additional configurations or settings as needed
    return formatter
}

