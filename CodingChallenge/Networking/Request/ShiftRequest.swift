//
//  ShiftRequest.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//

import Foundation

struct ShiftRequest: APIRequest {
    typealias ReturnType = ShiftResponse
    
    var path: String {"available_shifts"}
    
    var urlBuilder: APIURLBuilder { ShiftAPIBuilder() }
    let distance: Int
    let address: String
       
    let type: String
    var query: [String : APIQueryParameter] {
        [ "type": .string(type),
          "address": .string(address),
          "radius": .int(distance)
        ]
    }
}
