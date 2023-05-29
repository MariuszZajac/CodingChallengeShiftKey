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
        NavigationLink(destination: ShiftDetailView(shift: shift)) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("From:")
                    Text(formatDateTime(shift.normalizedStartDateTime))
                        .bold()
                }
                
                HStack {
                    Text("To:")
                    Text(formatDateTime(shift.normalizedEndDateTime))
                }
                
                HStack {
                    Text(shift.shiftKind)
                    Text("Place:")
                    Text(shift.facilityType.name)
                        .foregroundColor(Color(hex: shift.facilityType.color))
                }
            }
            .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
            .padding(10)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
        }
    }

    private func formatDateTime(_ dateTime: String) -> String {
       
        return dateTime
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

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
