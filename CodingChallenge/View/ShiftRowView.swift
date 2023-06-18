//
//  ShiftRowView.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 25/05/2023.
//

import SwiftUI

struct ShiftRowView: View {
    let shift: Shift
    
    var body: some View {
        NavigationLink(destination: ShiftDetailView(viewModel: ShiftDetailViewModel(shift: shift))) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(shift.shiftKind)
                    Text(",")
                    Text(shift.facilityType.name)
                        
                }
                .foregroundColor(.black)
                .font(.title3)
                .lineLimit(1)
                
                HStack {
                    Text("\(extractTimeFromDateTime(dateString: shift.normalizedStartDateTime))")
                        .bold()
                        .foregroundColor(.green)
                    Text("--->")
                        .foregroundColor(.blue)
                        .bold()
                    Text("\(extractTimeFromDateTime(dateString: shift.normalizedEndDateTime))")
                        .bold()
                        .foregroundColor(.red)
                }
                .bold()
            }
            .frame(maxWidth: .infinity)
            .fixedSize(horizontal: false, vertical: true)
            .padding(10)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
        }
    }
}

struct ShiftRowView_Previews: PreviewProvider {
    static var previews: some View {
        let shift = Shift(
            shiftId: 6215811,
            startTime: "2023-05-25T18:45:00+00:00",
            endTime: "2023-05-26T03:15:00+00:00",
            normalizedStartDateTime: "2023-05-25 13:45:00",
            normalizedEndDateTime: "2023-05-25 22:15:00",
            timezone: "Central",
            premiumRate: false,
            covid: false,
            shiftKind: "Evening Shift",
            withinDistance: 130,
            facilityType: FacilityType(id: 8, name: "Skilled Nursing Facility", color: "#AF52DE"),
            skill: Skill(id: 2, name: "Long Term Care", color: "#007AFF"),
            localizedSpecialty: LocalizedSpecialty(id: 154, specialtyId: 8, stateId: 44, name: "Licensed Vocational Nurse", abbreviation: "LVN", specialty: Specialty(id: 8, name: "Licensed Vocational/Practical Nurse", color: "#AF52DE", abbreviation: "LVN/LPN"))
        )
        
        return ShiftRowView(shift: shift)
    }
}

