//
//  HolidayDetailCoordinator.swift
//  HolidaysMVVM
//
//  Created by 이기완 on 2021/04/19.
//

import Foundation
import RxSwift
import ReactiveCoordinator


class HolidayDetailCoordinator: ReactiveCoordinator<Void> {
    
    let rootViewController: UIViewController
    var passedHoliday: Holiday!
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        let storyboard = UIStoryboard(name: "HolidayDetailViewController", bundle: nil)
        guard let holidayDetailVC = storyboard.instantiateInitialViewController() as? HolidayDetailViewController else { fatalError() }
        
        if let holiday = passedHoliday {
            holidayDetailVC.holiday = holiday
        }
        
        rootViewController.present(holidayDetailVC, animated: true, completion: nil)
        
        return Observable.empty()
    }
    
}
    
