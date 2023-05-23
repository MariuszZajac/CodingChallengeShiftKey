//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    @StateObject private var shiftsViewModel = ShiftsViewModel()
        
        var body: some View {
            List(shiftsViewModel.shifts, id: \.id) { shift in
                ShiftCell(shift: shift)
            }
            .onAppear {
                shiftsViewModel.fetchShifts()
            }
        }
    }

    struct ShiftCell: View {
        let shift: Shift
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(shift.position)
                    .font(.headline)
                Text(shift.dateAndTime)
                    .font(.subheadline)
                // Add any other relevant shift information here
            }
        }
    }

    struct ShiftsView_Previews: PreviewProvider {
        static var previews: some View {
            ShiftsView()
        }
    }
