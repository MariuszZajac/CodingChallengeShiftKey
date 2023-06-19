//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    @StateObject var viewModel: ShiftsViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack {
                    ShiftCalendarView()
                    Spacer()
                        .frame(height: 20)
                    SearchView(viewModel: SearchViewModel(shiftsViewModel: ShiftsViewModel()))
                }
                .padding(.top)
                
                Spacer()
                    .frame(height: 20)
                ScrollView {
                    LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                        
                        ForEach(viewModel.dataShifts, id: \.date) { shiftCollection in
                            Section {
                                ForEach(shiftCollection.shifts, id: \.shiftId) { shift in
                                    ShiftRowView(shift: shift)
                                }
                            } header: {
                                Text(shiftCollection.date)
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchShifts(distance: 10, address: "Dallas, TX", type: "4day")
            }
            Spacer()
        }
    }
}




//api.fetchShifts(withinDistance: distance, address: address, type: type) { shifts in
//        DispatchQueue.main.async {
//            self.shifts = shifts.sorted { $0.startTime < $1.startTime }
//            self.shifts = shifts.sorted{ $0.withinDistance < $1.withinDistance }
struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView(viewModel: ShiftsViewModel())
    }
}

