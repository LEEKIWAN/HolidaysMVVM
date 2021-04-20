//
//  HolidayDetailViewModel.swift
//  HolidaysMVVM
//
//  Created by 이기완 on 2021/04/19.
//

import Foundation
import RxSwift
import RxCocoa

class HolidayDetailViewModel: ViewModelType {
    var input = Input()
    var output = Output()
    
    struct Input {
    }
    
    struct Output {
        let selectedHoliday = BehaviorRelay<Holiday?>(value: nil)
    }
}
