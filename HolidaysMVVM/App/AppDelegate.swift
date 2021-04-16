//
//  AppDelegate.swift
//  HolidaysMVVM
//
//  Created by kiwan on 2021/04/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
//    private var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let appCoordinator = AppCoordinator(window: window!)
        
        appCoordinator.start()
            .subscribe()
            .disposed(by: rx.disposeBag)
        
        
        return true
    }


}

