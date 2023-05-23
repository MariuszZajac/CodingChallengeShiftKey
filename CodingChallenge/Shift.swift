//
//  Shift.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 23/05/2023.
//

import SwiftUI

struct Shift: Codable {
    let id: String
    let position: String
    let dateAndTime: String
    let type: String?
    let start: String?
    let end: String?
    let address: String
    let radius: Int?
}

