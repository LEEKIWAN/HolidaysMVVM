//
//  CountriesService.swift
//  HolidaysMVVM
//
//  Created by kiwan on 2021/04/16.
//

import Foundation

class CountriesService {
    
    static let shared = CountriesService()
    
    
    func getCountries(success: @escaping (Int, Countries) -> (), failure: @escaping (String) -> ()) {
        APIClient.shared.get(urlString: API_GET_COUNTRIES) { (code, countries) in
            success(code, countries)
        } failure: { (error) in
            failure(error)
        }
    }
    
}
