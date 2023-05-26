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
    @State private var searchRadius: Int = 0
    @State private var isSearchingExactValue = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter search radius", value: $searchRadius, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)

                    Button(action: {
                        searchShifts()
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                    }) {
                        Text("Search")
                            .padding(.horizontal)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)

                Spacer()
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
                fetchShifts()
            }
        }
    }
    
    private func fetchShifts() {
        api.fetchShifts(withinDistance: 150 , address: "Dallas, TX", type: "4day") { shifts in
            DispatchQueue.main.async {
                self.shifts = shifts.sorted { $0.startTime < $1.startTime }

            }
        }
    }
    private func searchShifts() {
        let roundedRadius = ((searchRadius + 9) / 10) * 10 // Round up to the nearest multiple of 10
        api.fetchShifts(withinDistance: roundedRadius , address: "Dallas, TX", type: "4day") { shifts in
            DispatchQueue.main.async {
                self.shifts = shifts
            }
            print("Search Radius: \(roundedRadius)")
        }
    }
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
    }
}
