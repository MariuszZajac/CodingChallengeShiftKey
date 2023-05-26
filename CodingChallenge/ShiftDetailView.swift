//
//  ShiftDetailView.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 26/05/2023.
//

import SwiftUI

struct ShiftDetailView: View {
    let shift: Shift
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Shift Details")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            VStack(alignment: .leading, spacing: 8) {
                DetailRow(title: "Shift ID", value: "\(shift.shiftId)")
                DetailRow(title: "Start Time", value: shift.normalizedStartDateTime)
                DetailRow(title: "End Time", value: shift.normalizedEndDateTime)
                DetailRow(title: "Premium Rate", value: shift.premiumRate ? "Yes" : "No")
                DetailRow(title: "COVID", value: shift.covid ? "Yes" : "No")
                DetailRow(title: "Shift Kind", value: shift.shiftKind)
                DetailRow(title: "Within Distance", value: "\(shift.withinDistance) miles")
                DetailRow(title: "Facility Type", value: shift.facilityType.name)
                DetailRow(title: "Skill", value: shift.skill.name)
                DetailRow(title: "Localized Specialty", value: shift.localizedSpecialty.name)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .padding(.top, 20)
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.medium)
            Spacer()
            Text(value)
                .foregroundColor(.gray)
        }
    }
}


struct ShiftDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let shift = Shift(shiftId: 1, startTime: "9:00 AM", endTime: "", normalizedStartDateTime: "9:00 AM", normalizedEndDateTime: "5:00 PM", timezone: "", premiumRate: true, covid: false, shiftKind: "", withinDistance: 10, facilityType: FacilityType(id: 1, name: "Facility", color: ""), skill: Skill(id: 1, name: "Skill", color: ""), localizedSpecialty: LocalizedSpecialty(id: 1, specialtyId: 1, stateId: 1, name: "Specialty", abbreviation: "", specialty: Specialty(id: 1, name: "Specialty", color: "", abbreviation: "")))
        
        ShiftDetailView(shift: shift)
    }
}
