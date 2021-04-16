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
        print("d")
        
        return Observable.never()
    }
    
    // MARK: - Coordination
//    private func coordinateToHolidayDetail(with holidayViewModel: HolidayViewModel) -> Observable<Void> {
//        let holidayDetailCoordinator = HolidayDetailCoordinator(rootViewController: rootViewController)
//        holidayDetailCoordinator.viewModel = holidayViewModel
//        return coordinate(to: holidayDetailCoordinator)
//            .map { _ in () }
//    }
//    
//    private func coordinateToChooseCountry() -> Observable<String?> {
//        let chooseCountryCoordinator = ChooseCountryCoordinator(rootViewController: rootViewController)
//        return coordinate(to: chooseCountryCoordinator)
//            .map { result in
//                switch result {
//                case .country(let country): return country
//                case .cancel: return nil
//                }
//            }
//    }
    
}

