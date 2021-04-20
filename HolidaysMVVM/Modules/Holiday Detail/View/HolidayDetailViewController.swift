//
//  HolidayDetailViewController.swift
//  HolidaysMVVM
//
//  Created by 이기완 on 2021/04/19.
//

import Foundation
import UIKit


class HolidayDetailViewController: UIViewController {
    var holiday: Holiday!
    
    var viewModel = HolidayDetailViewModel()
    
    override func viewDidLoad() {
        print(holiday)
    }
}
