//
//  ChooseCountryViewModel.swift
//  HolidaysMVVM
//
//  Created by 이기완 on 2021/04/19.
//

import Foundation
import RxSwift
import RxCocoa


class ChooseCountryViewModel: ViewModelType {
    var input = Input()
    var output = Output()
    
    struct Input {
        let closeTouched = PublishSubject<Void>()
        let selectedCountry = PublishSubject<Country>()
    }
    
    struct Output {
        let isLoading = BehaviorRelay<Bool>(value: false)
        let fetchedCountries = BehaviorRelay<[Country]>(value: [])
    }
    
    func fetchcountries() {
        output.isLoading.accept(true)
        
        CountriesService.shared.getCountries { [weak self] (code, countries) in
            self?.output.isLoading.accept(false)
            self?.output.fetchedCountries.accept(countries.countries)
        } failure: { (error) in
            print(error)
        }

    }
    
}

