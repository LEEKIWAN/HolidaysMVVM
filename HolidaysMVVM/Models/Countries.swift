//
//  Countries.swift
//  HolidaysMVVM
//
//  Created by kiwan on 2021/04/16.
//

import Foundation


// MARK: - Response
struct Countries: Codable {
    let status: Int
    let requests: Requests
    let countries: [Country]
}

// MARK: - Country
struct Country: Codable {
    let code, name: String
    let codes: Codes
    let languages: [String]
    let flag: String
    let subdivisions: [Subdivision]
}

// MARK: - Codes
struct Codes: Codable {
    let alpha2, alpha3, numeric: String

    enum CodingKeys: String, CodingKey {
        case alpha2 = "alpha-2"
        case alpha3 = "alpha-3"
        case numeric
    }
}

// MARK: - Subdivision
struct Subdivision: Codable {
    let code, name: String
    let languages: [String]
}

// MARK: - Requests
struct Requests: Codable {
    let used, available: Int
    let resets: String
}
