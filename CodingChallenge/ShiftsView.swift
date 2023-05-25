//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    @StateObject private var api = Api()
       
       var body: some View {
           List(api.shifts) { shift in
               VStack(alignment: .leading) {
                   Text("Start Date: \(shift.normalizedStartDateTime)")
                  
                   Text("Start Time: \(shift.startTime)")
                   Text("End Time: \(shift.endTime)")
                   // Add more shift properties as needed
               }
           }
           .onAppear {
               api.fetchShifts { shifts in
                   // Update the shifts data
               }
           }
       }
   }

        
        struct ShiftsView_Previews: PreviewProvider {
            static var previews: some View {
                ShiftsView()
            }
        }
    
