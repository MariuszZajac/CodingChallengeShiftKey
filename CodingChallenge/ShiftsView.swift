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
   
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack {
                    ShiftCalendarView()
                    Spacer()
                        .frame(height: 20)
                    SearchView()
                }
                .padding(.top)
                
                Spacer()
                    .frame(height: 20)
                VStack {
                    if shifts.isEmpty {
                        ProgressView("Loading shifts...")
                    } else {
                        List(shifts) { shift in
                            ShiftRowView(shift: shift)
                        }
                    }
                }
                Spacer()
            }
            
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
    
}
struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
    }
}
