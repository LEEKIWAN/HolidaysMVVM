//
//  ViewModelType.swift
//  HolidaysMVVM
//
//  Created by 이기완 on 2021/04/19.
//

import Foundation


protocol ViewModelType {
    associatedtype Input
    associatedtype Output
        
    var input: Input { get }
    var output: Output { get }
}

