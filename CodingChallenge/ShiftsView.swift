//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    private let api = Api()
    @State var shifts: [Shift] = []
    @State private var searchRadius: Int = 1
    @State private var isSearchingExactValue = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    ShiftCalendarView()
                    HStack {
                        TextField("Enter search radius", value: $searchRadius, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)

                        Button(action: {
                            let roundedRadius = ((searchRadius + 9) / 10) * 10
                            fetchShifts(withinDistance: roundedRadius, address: "Dallas, TX", type: "4day")
                          

                        }) {
                            Text("Search")
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                }

                VStack {
                    if shifts.isEmpty {
                        ProgressView("Loading shifts...")
                    } else {
                        List(shifts) { shift in
                            ShiftRowView(shift: shift)
                        }
                    }
                }
            }
            .navigationTitle("Available Shifts")
            .task {
                fetchShifts(withinDistance: 150, address: "Dallas, TX", type: "4day")
            }
        }
    }
    
    private func fetchShifts(withinDistance distance: Int, address: String, type: String) {
        api.fetchShifts(withinDistance: distance, address: address, type: type) { shifts in
            DispatchQueue.main.async {
                self.shifts = shifts.sorted { $0.startTime < $1.startTime }
                self.shifts = shifts.sorted{ $0.withinDistance < $1.withinDistance }
            }
        }
    }

    //private func searchShifts() {
//
//
//
//        // Round up to the nearest multiple of 10
//        api.fetchShifts(withinDistance: roundedRadius , address: "Dallas, TX", type: "4day") { shifts in
//            DispatchQueue.main.async {
//                self.shifts = shifts
//            }
//            print("Search Radius: \(roundedRadius)")
//        }
//    }
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
    }
}
