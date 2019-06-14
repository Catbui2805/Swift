//
//  ViewController.swift
//  AlamofireHTTP Json web api
//
//  Created by Nguyen Tran Cong on 6/10/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

// nguoi lao dong ,
import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    let url = "http://divedeep.azurewebsites.net/api/NewsArticles?page=1&pageSize=10"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        Alamofire.request("http://divedeep.azurewebsites.net/api/NewsArticles?page=1&pageSize=10").responseJSON { response in
////            print("Request: \(String(describing: response.request))")   // original url request
////            print("Response: \(String(describing: response.response))") // http url response
////            print("Result: \(response.result)")                         // response serialization result
//
//            if response.result.value != nil {
////                print("JSON: \(json)") // serialized json response
//
//            }
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//
//
//            }
//        }
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let a = json["data"].array!
                for item in a {
                    print(item)
                    print(item["image"])
                    print(item["publishDate"])
                    print(item["title"])
                    print(item["url"])
                    print(item["description"])
                    print(item["id"])
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

