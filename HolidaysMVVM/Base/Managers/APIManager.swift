//
//  APIManager.swift
//  HolidaysMVVM
//
//  Created by kiwan on 2021/04/16.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    lazy var baseURL = "https://holidayapi.com/v1/"    
    lazy var apiKey = "56fb27d9-fe83-4867-9d02-19cc3b21434c"
}
