//
//  SearchViewModel.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 19/06/2023.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchRadius: Int!
    let shiftsViewModel: ShiftsViewModel

    init(shiftsViewModel: ShiftsViewModel) {
        self.shiftsViewModel = shiftsViewModel
    }

    func search() {
        let roundedDistance = ((searchRadius + 9) / 10) * 10
       // shiftsViewModel.fetchShifts(distance: roundedDistance, address: "Dallas, TX", type: "4day")
    }
}
