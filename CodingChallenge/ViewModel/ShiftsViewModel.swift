//
//  MyViewModel.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//

import Foundation

class ShiftsViewModel<T: Codable>: ObservableObject {
    @Published var data: T?
}
