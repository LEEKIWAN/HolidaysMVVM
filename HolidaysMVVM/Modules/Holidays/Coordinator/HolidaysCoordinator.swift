//
//  HolidaysCoordinator.swift
//  HolidaysMVVM
//
//  Created by kiwan on 2021/04/17.
//

import Foundation
import RxSwift
import ReactiveCoordinator

class HolidaysCoordinator: ReactiveCoordinator<Void> {
    
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        guard let viewModel = (rootViewController as? HolidaysViewController)?.viewModel else { return Observable.never() }
        
        
        viewModel.input.chooseCountryTouched.flatMap { [weak self] Void -> Observable<Country?> in
            guard let self = self else { return .empty() }
            return self.coordinateToChooseCountry()
        }
        .filter { $0 != nil }
        .map { $0! }
        .bind(to: viewModel.input.selectedCountry)
        .disposed(by: rx.disposeBag)
        
        
        viewModel.input.selectedHoliday.flatMap { [weak self] holiday -> Observable<Void> in
            guard let self = self else { return Observable.empty() }
            return self.coordinateToHolidayDetail(with: holiday)
        }
        .subscribe()
        .disposed(by: rx.disposeBag)
        
        
        return Observable.never()
    }
    
    // MARK: - Coordination
    private func coordinateToChooseCountry() -> Observable<Country?> {
        let chooseCountryCoordinator = ChooseCountryCoordinator(rootViewController: rootViewController)
 
        
        return coordinate(to: chooseCountryCoordinator)
            .map { result in
                switch result {
                case .country(let country):
                    print("country")
                    return country
                case .cancel:
                    print("cancel")
                    return nil
                }
            }
    }
    
    private func coordinateToHolidayDetail(with: Holiday) -> Observable<Void> {
        let chooseCountryCoordinator = HolidayDetailCoordinator(rootViewController: rootViewController)
 
        
        
        return coordinate(to: chooseCountryCoordinator)
    }
    
    
//    private func coordinateToHolidayDetail(with holidayViewModel: HolidayViewModel) -> Observable<Void> {
//        let holidayDetailCoordinator = HolidayDetailCoordinator(rootViewController: rootViewController)
//        holidayDetailCoordinator.viewModel = holidayViewModel
//        return coordinate(to: holidayDetailCoordinator)
//            .map { _ in () }
//    }


}
