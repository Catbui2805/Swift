//
//  ViewController.swift
//  toolGetData
//
//  Created by Nguyen Tran Cong on 5/7/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var log: UILabel!
    @IBOutlet weak var formtext: UITextField!
    @IBOutlet weak var toText: UITextField!
    
    @IBOutlet weak var lastFrom: UILabel!
    @IBOutlet weak var lastTo: UILabel!
    
    
    @IBOutlet weak var countCurrent: UILabel!
    
    @IBOutlet weak var btRun: UIButton!
    
    @IBAction func btTapped(_ sender: UIButton) {
        DispatchQueue.global().async {
            self.getData()
        }
        lastFrom.text = formtext.text
        lastTo.text = toText.text
    }
    
    
    var counter = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        //        getData()
        
        
        
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        DispatchQueue.global().async {
    //            self.getData()
    //        }
    //
    //    }
    
    func url(_ index: Int) -> URL {
        return URL(string: xxxxxx
    }
    
    func getData() {
        var text = "log"
        guard let form  = Int(formtext.text!), let to = Int(toText.text!), form < to else {
            countCurrent.text = "value not able. try again, from < to"
            return
        }
        
        for index in form...to {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                
                
                let task = URLSession.shared.dataTask(with: self.url(index)) { (data, response, error) in
//                    guard let dataResponse = data,
//                        error == nil else {
//                            print(error?.localizedDescription ?? "Response Error")
//                            return }
                    
                    guard error == nil else {
                        return
                    }
                    
                    guard let data = data else {
                        return
                    }
                    do {
                        //create json object from data
                        if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                            print(json)
                            self.ref.childByAutoId().setValue(json["data"])
//                            self.ref.child(item.catID!).child(item.sid!).setValue(["cat_id": item.catID!,"sid": item.sid,"content": item.content,"createdAt": item.createdAt])
//                            saveToJsonFile(json, index: index)
                        }
                        //                do{
                        //here dataResponse received from a network request
                        //                    _ = try JSONSerialization.jsonObject(with:
                        //                        dataResponse, options: [])
                        //
                        //                    let post = try Post(data: dataResponse)
                        //                    print(post.data?.count ?? 0)
                        //                    if let data = post.data {
                        //                        for (i,item) in data.enumerated() {
                        //
                        //                            self.ref.child(item.catID!).child(item.sid!).setValue(["cat_id": item.catID!,"sid": item.sid,"content": item.content,"createdAt": item.createdAt])
                        //                            DispatchQueue.main.async { // Correct
                        //                                self.countCurrent.text = "item: \(i) <-- page:\(index)--"
                        //                            }
                        //                        }
                        //                    }
                        //                    print("---->>> page: \(index)")
                        //                    text += "---->>> page: \(index)\n"
                    } catch let parsingError {
                        print("Error", parsingError)
                        text += "---->>> Error: \(parsingError)\n"
                    }
                    DispatchQueue.main.async {
                        self.log.text = text
                    }
                }
                task.resume()
            }
        }
    }
}

