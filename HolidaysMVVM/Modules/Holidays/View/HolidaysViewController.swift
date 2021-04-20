//
//  HolidaysViewController.swift
//  HolidaysMVVM
//
//  Created by kiwan on 2021/04/17.
//

import UIKit

class HolidaysViewController: UIViewController {

    let viewModel: HolidaysViewModel = HolidaysViewModel()
    
    @IBOutlet weak var chooseCountryButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        viewModel.fetchHolidays()
    }
    
    
    
    func bind() {
        chooseCountryButton.rx.tap
            .bind(to: viewModel.input.chooseCountryTouched)
            .disposed(by: rx.disposeBag)
        
        
        viewModel.input.selectedCountry
            .subscribe(onNext: { [weak self] country in
            self?.chooseCountryButton.title = country.name
        })
        .disposed(by: rx.disposeBag)
        
        
        
        viewModel.output.fetchedHolidays
            .bind(to: tableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: "HolidayCell")!
                cell.textLabel?.text = element.name
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        
        
        tableView.rx.modelSelected(Holiday.self)
            .bind(to: viewModel.input.selectedHoliday)
            .disposed(by: rx.disposeBag)
        
    }
    
//    5000
    /*
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
