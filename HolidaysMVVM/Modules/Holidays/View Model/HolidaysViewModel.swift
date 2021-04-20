//
//  HolidaysViewModel.swift
//  HolidaysMVVM
//
//  Created by kiwan on 2021/04/17.
//

import Foundation
import RxSwift
import RxCocoa

class HolidaysViewModel: NSObject, ViewModelType {
    var input = Input()
    var output = Output()
    
    struct Input {
        let chooseCountryTouched = PublishSubject<Void>()
        let selectedCountry = PublishSubject<Country>()
        let selectedHoliday = PublishSubject<Holiday>()
    }
    
    struct Output {
        let isLoading = BehaviorRelay<Bool>(value: false)
        let fetchedHolidays = PublishRelay<[Holiday]>()
    }
    
    func fetchHolidays() {
        input.selectedCountry.subscribe(onNext: { [weak self] country in
            self?.output.isLoading.accept(true)
            
            HolidaysService.shared.getHolidays(country: country.code) { (code, holidays) in                
                self?.output.fetchedHolidays.accept(holidays.holidays)
                self?.output.isLoading.accept(false)
            } failure: { (error) in
                print(error)
                self?.output.isLoading.accept(false)
            }

        })
        .disposed(by: rx.disposeBag)
    }
}
