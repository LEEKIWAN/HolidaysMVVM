//
//  ChooseCountryCoordinator.swift
//  HolidaysMVVM
//
//  Created by 이기완 on 2021/04/19.
//

import Foundation
import RxSwift
import ReactiveCoordinator

enum ChooseCountryCoordinationResult {
    case country(Country)
    case cancel
}


class ChooseCountryCoordinator: ReactiveCoordinator<ChooseCountryCoordinationResult> {
    
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<ChooseCountryCoordinationResult> {        
        let storyboard = UIStoryboard(name: "ChooseCountryViewController", bundle: nil)
        guard let chooseCountryVC = storyboard.instantiateInitialViewController() as? ChooseCountryViewController else { fatalError() }
        
        rootViewController.present(chooseCountryVC, animated: true, completion: nil)
        
        let viewModel = chooseCountryVC.viewModel
        
        let cancel = viewModel.input.closeTouched.map {
            return CoordinationResult.cancel
        }
        
        let country = viewModel.input.selectedCountry.map {
            return CoordinationResult.country($0)
        }
            
        
        return Observable.merge(country, cancel)
            .take(1)
            .do(onNext: { result in
                print("selectred " , result)
                chooseCountryVC.dismiss(animated: true, completion: nil)
            })
    }
    
    // MARK: - Coordination
//    private func coordinateToHolidayDetail(with holidayViewModel: HolidayViewModel) -> Observable<Void> {
//        let holidayDetailCoordinator = HolidayDetailCoordinator(rootViewController: rootViewController)
//        holidayDetailCoordinator.viewModel = holidayViewModel
//        return coordinate(to: holidayDetailCoordinator)
//            .map { _ in () }
//    }
//
    
}
