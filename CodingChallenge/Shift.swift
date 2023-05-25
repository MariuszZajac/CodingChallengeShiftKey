//
//  Shift.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 23/05/2023.
//

import SwiftUI

struct Shift: Codable, Identifiable {
    var id = UUID()
    
    let shift_id: Int
    let normalized_start_date_time: Date
    let normalized_end_date_time: Date
    let shift_kind: String
    let within_distance: Int
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
