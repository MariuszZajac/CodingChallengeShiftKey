//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    @State private var shifts = [Shift]()
  
    var body: some View {
        List (shifts) {shifts in
            
            Text("\(shifts.shift_id)")
                .bold()
            
        }
                .padding(3)
                .onAppear{
                    Api().fetchShifts{(shifts) in self.shifts = shifts}
                }
                .navigationTitle("Shifts")
            }
        
    }
        
        struct ShiftsView_Previews: PreviewProvider {
            static var previews: some View {
                ShiftsView()
            }
        }
    
