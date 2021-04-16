//
//  AppCoordinator.swift
//  HolidaysMVVM
//
//  Created by kiwan on 2021/04/17.
//

import Foundation
import RxSwift
import ReactiveCoordinator

class AppCoordinator: ReactiveCoordinator<Void> {
    
    var window: UIWindow
    
    internal init(window: UIWindow) {
        self.window = window
    }

    
    override func start() -> Observable<Void> {
        let storyboard = UIStoryboard(name: "HolidaysViewController", bundle: nil)
        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController else { fatalError() }
          
        let holidaysCoordinator = HolidaysCoordinator(rootViewController: navigationController.viewControllers[0])
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return coordinate(to: holidaysCoordinator)
    }
}
