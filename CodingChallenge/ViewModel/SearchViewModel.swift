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
    let searchRadiusData: [ Shift]
    
    init(shiftsViewModel: ShiftsViewModel) {
        self.shiftsViewModel = shiftsViewModel
        self.searchRadiusData = []
    }

    func search()-> [Shift]  {
        let roundedDistance = ((searchRadius + 9) / 10) * 10
      // return roundedDistance
       shiftsViewModel.fetchShifts(distance: roundedDistance, address: "Dallas, TX", type: "4day")
        return searchRadiusData
    }
}
