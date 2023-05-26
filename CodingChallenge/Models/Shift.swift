//
//  Shift.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 23/05/2023.
//

import SwiftUI

struct Specialty: Codable {
    let id: Int
    let name: String
    let color: String
    let abbreviation: String
}

struct LocalizedSpecialty: Codable {
    let id: Int
    let specialtyId: Int
    let stateId: Int
    let name: String
    let abbreviation: String
    let specialty: Specialty
    
    enum CodingKeys: String, CodingKey {
            case id
            case specialtyId = "specialty_id"
            case stateId = "state_id"
            case name
            case abbreviation
            case specialty
        }
}

struct FacilityType: Codable {
    let id: Int
    let name: String
    let color: String
}

struct Skill: Codable {
    let id: Int
    let name: String
    let color: String
}

struct Shift: Codable, Identifiable {
    var id: Int { shiftId }
    let shiftId: Int
    let startTime: String
    let endTime: String
    let normalizedStartDateTime: String
    let normalizedEndDateTime: String
    let timezone: String
    let premiumRate: Bool
    let covid: Bool
    let shiftKind: String
    let withinDistance: Int
    let facilityType: FacilityType
    let skill: Skill
    let localizedSpecialty: LocalizedSpecialty
    
    enum CodingKeys: String, CodingKey {
        case shiftId = "shift_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case normalizedStartDateTime = "normalized_start_date_time"
        case normalizedEndDateTime = "normalized_end_date_time"
        case timezone
        case premiumRate = "premium_rate"
        case covid
        case shiftKind = "shift_kind"
        case withinDistance = "within_distance"
        case facilityType = "facility_type"
        case skill
        case localizedSpecialty = "localized_specialty"
    }
}

struct ShiftData: Codable {
    let date: String
    let shifts: [Shift]
}

struct ShiftResponse: Codable {
    let data: [ShiftData]
}

//"date": "2023-05-24",
//            "shifts": [
//                {
//                    "shift_id": 5988487,
//                    "start_time": "2023-05-24T11:00:00+00:00",
//                    "end_time": "2023-05-24T23:00:00+00:00",
//                    "normalized_start_date_time": "2023-05-24 06:00:00",
//                    "normalized_end_date_time": "2023-05-24 18:00:00",
//                    "timezone": "Central",
//                    "premium_rate": false,
//                    "covid": false,
//                    "shift_kind": "Day Shift",
//                    "within_distance": 150,
//                    "facility_type": {
//                        "id": 8,
//                        "name": "Skilled Nursing Facility",
//                        "color": "#AF52DE"
//                    },
//                    "skill": {
//                        "id": 2,
//                        "name": "Long Term Care",
//                        "color": "#007AFF"
//                    },
//                    "localized_specialty": {
//                        "id": 154,
//                        "specialty_id": 8,
//                        "state_id": 44,
//                        "name": "Licensed Vocational Nurse",
//                        "abbreviation": "LVN",
//                        "specialty": {
//                            "id": 8,
//                            "name": "Licensed Vocational/Practical Nurse",
//                            "color": "#AF52DE",
//                            "abbreviation": "LVN/LPN"
//                        }
//                    }
//                },
//                {
//
