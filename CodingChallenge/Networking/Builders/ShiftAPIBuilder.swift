//
//  ShiftAPIBuilder.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//

import Foundation

struct ShiftAPIBuilder: APIURLBuilder {
    var host: String { "staging-app.shiftkey.com" }
    
    var root: String { "api" }
    var version: String? { "v2" }
    
    
    //"https://staging-app.shiftkey.com/api/v2"
    
}
