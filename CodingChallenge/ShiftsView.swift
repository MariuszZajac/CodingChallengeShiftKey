//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    @StateObject private var api = Api()
    @State private var searchRadius: Int = 1
    @State private var isSearchingExactValue = false
    
    var body: some View {
        NavigationStack{
            
            HStack {
                TextField("Enter search radius", value: $searchRadius, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                Button(action: {
                    searchShifts()
                }) {
                    Text("Search")
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            
            VStack {
                if api.shifts.isEmpty {
                    ProgressView("Loading shifts...")
                    
                } else {
                    List(api.shifts) { shift in
                        ShiftRowView(shift: shift)
                    }
                    
                }
            }
            .navigationTitle("Available Shifts")
            .onAppear {
                fetchShifts()
            }
            //  .searchable(text: $searchRadius, prompt: "Enter search radius")
        }
    }
    
    private func fetchShifts() {
        api.fetchShifts(withinDistance: 150 , address: "Dallas, TX", type: "4day") { shifts in
            DispatchQueue.main.async {
                api.shifts = shifts
            }
        }
    }
    private func searchShifts() {
        let roundedRadius = ((searchRadius + 9) / 10) * 10 // Round up to the nearest multiple of 10
        api.fetchShifts(withinDistance: roundedRadius , address: "Dallas, TX", type: "4day") { shifts in
            DispatchQueue.main.async {
                api.shifts = shifts
            }
            print("Search Radius: \(roundedRadius)")
            //   print("Search Radius: \(searchRadius)")
            //print("Is Searching Exact Value: \(isSearchingExactValue)")
        }
    }
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
    }
}
