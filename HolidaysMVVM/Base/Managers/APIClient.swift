//
//  APIClient.swift
//  HolidaysMVVM
//
//  Created by kiwan on 2021/04/16.
//

import Foundation
import RxSwift
import RxAlamofire
import NSObject_Rx

class APIClient: NSObject {
    
    static let shared = APIClient(baseURL: APIManager.shared.baseURL)
    
    var baseURL: URL?
    
    
    init(baseURL: String) {
        self.baseURL = URL(string: baseURL)
    }
    
    func get<T: Codable>(urlString: String, parameters: [String: Any] = [:], success: @escaping (Int, T) -> (), failure: @escaping (String) -> ()) {
        guard let url = URL(string: urlString, relativeTo: baseURL)  else { return }
        var parameters = parameters
        parameters["key"] = APIManager.shared.apiKey
        
        let urlString = url.absoluteString
        
        request(.get, urlString, parameters: parameters, headers: nil)
            .validate(statusCode: 200 ..< 300)
            .validate(contentType: ["application/json"])
            .responseData()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { response, data in
                let statusCode = response.statusCode
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(T.self, from: data)
                    
                    if let prettyJSON = data.prettyPrintedJSONString {
                        print(prettyJSON)
                    }
                    
                    success(statusCode, json)
                }
                catch {
                    failure(error.localizedDescription)
                }
                
                
            }, onError: { error in
                failure(error.localizedDescription)
            })
            .disposed(by: rx.disposeBag)
        
    }
}


