//
//  ShiftDetailModel.swift
//  CodingChallenge
//
//  Created by Mariusz Zając on 16/06/2023.
//
import Foundation

struct ShiftDetailViewModel {
    let shift: Shift

    var shiftID: String {
        return "\(shift.shiftId)"
    }

    var startTime: String {
        return shift.normalizedStartDateTime
    }

    var endTime: String {
        return shift.normalizedEndDateTime
    }

    var premiumRate: String {
        return shift.premiumRate ? "Yes" : "No"
    }

    var covid: String {
        return shift.covid ? "Yes" : "No"
    }

    var shiftKind: String {
        return shift.shiftKind
    }

    var withinDistance: String {
        return "\(shift.withinDistance) miles"
    }

    var facilityType: String {
        return shift.facilityType.name
    }

    var skill: String {
        return shift.skill.name
    }

    var localizedSpecialty: String {
        return shift.localizedSpecialty.name
    }
}

