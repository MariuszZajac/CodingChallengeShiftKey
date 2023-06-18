//
//  ShiftDetailView.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 26/05/2023.
//

import SwiftUI


struct ShiftDetailView: View {
    let viewModel: ShiftDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                DetailRow(title: "Shift ID", value: viewModel.shiftID)
                DetailRow(title: "Start Time", value: viewModel.startTime)
                DetailRow(title: "End Time", value: viewModel.endTime)
                DetailRow(title: "Premium Rate", value: viewModel.premiumRate)
                DetailRow(title: "COVID", value: viewModel.covid)
                DetailRow(title: "Shift Kind", value: viewModel.shiftKind)
                DetailRow(title: "Within Distance", value: viewModel.withinDistance)
                DetailRow(title: "Facility Type", value: viewModel.facilityType)
                DetailRow(title: "Skill", value: viewModel.skill)
                DetailRow(title: "Localized Specialty", value: viewModel.localizedSpecialty)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .navigationTitle("Shift Details")
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
        let shift = Shift(shiftId: 1, startTime: "9:00 AM", endTime: "", normalizedStartDateTime: "", normalizedEndDateTime: "5:00 PM", timezone: "", premiumRate: true, covid: false, shiftKind: "", withinDistance: 10, facilityType: FacilityType(id: 1, name: "Facility", color: ""), skill: Skill(id: 1, name: "Skill", color: ""), localizedSpecialty: LocalizedSpecialty(id: 1, specialtyId: 1, stateId: 1, name: "Specialty", abbreviation: "", specialty: Specialty(id: 1, name: "Specialty", color: "", abbreviation: "")))
        
        ShiftDetailView(viewModel: ShiftDetailViewModel(shift: shift))

    }
}
