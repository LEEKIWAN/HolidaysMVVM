//
//  ChooseCountryViewController.swift
//  HolidaysMVVM
//
//  Created by 이기완 on 2021/04/19.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class ChooseCountryViewController: UIViewController {

    let viewModel = ChooseCountryViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        viewModel.fetchcountries()
    }
    

    
    func bind() {
        closeButton.rx.tap
            .bind(to: viewModel.input.closeTouched)
            .disposed(by: rx.disposeBag)
        
        viewModel.output.fetchedCountries
            .bind(to: tableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell")!
                cell.textLabel?.text = element.name
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        
        viewModel.output.isLoading
            .map({ !$0 })
            .bind(to: indicatorView.rx.isHidden)
            .disposed(by: rx.disposeBag)
        
        
        tableView.rx.modelSelected(Country.self)
            .bind(to: viewModel.input.selectedCountry)
            .disposed(by: rx.disposeBag)
    }
    
    
    deinit {
        print("deinit")
    }
    /*
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

