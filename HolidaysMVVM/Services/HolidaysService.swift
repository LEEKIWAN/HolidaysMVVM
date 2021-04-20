//
//  HolidayService.swift
//  HolidaysMVVM
//
//  Created by 이기완 on 2021/04/19.
//

import Foundation

class HolidaysService {
    
    static let shared = { HolidaysService() }()
    
    func getHolidays(country code: String, success: @escaping (Int, Holidays) -> (), failure: @escaping (String) -> ()) {
        
        typealias Parameters = [String : Any]
        
        let parameters: Parameters = ["country": code,
                                      "year": "2020"]
        
        APIClient.shared.get(urlString: API_GET_HOLIDAYS, parameters: parameters, success: { (code, holidays) in
            success(code, holidays)
        }) { (error) in
            failure(error)
        }
    }
}

