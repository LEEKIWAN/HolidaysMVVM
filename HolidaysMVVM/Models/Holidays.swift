//
//  Holidays.swift
//  HolidaysMVVM
//
//  Created by 이기완 on 2021/04/19.
//

import Foundation


// MARK: - Welcome
struct Holidays: Codable {
    let status: Int
    let warning: String
    let requests: Requests
    let holidays: [Holiday]
}

// MARK: - Holiday
struct Holiday: Codable {
    let name, date, observed: String
    let holidayPublic: Bool
    let country: String
    let uuid: String
    let weekday: Weekday

    enum CodingKeys: String, CodingKey {
        case name, date, observed
        case holidayPublic = "public"
        case country, uuid, weekday
    }
}

// MARK: - Weekday
struct Weekday: Codable {
    let date, observed: DateClass
}

// MARK: - DateClass
struct DateClass: Codable {
    let name: Name
    let numeric: String
}

enum Name: String, Codable {
    case friday = "Friday"
    case monday = "Monday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    case thursday = "Thursday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
}


