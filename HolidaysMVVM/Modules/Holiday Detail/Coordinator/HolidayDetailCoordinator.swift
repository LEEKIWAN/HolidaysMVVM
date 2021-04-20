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
    var selectedHoliday: Holiday?
    
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        
        return Observable.empty()
    }
    
}
    
