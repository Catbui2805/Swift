//
//  webViewStackViewViewController.swift
//  SwiftSoupHTML
//
//  Created by Nguyen Tran Cong on 6/7/19.
//  Copyright © 2019 com.devideep. All rights reserved.
//

import UIKit
import SwiftSoup

class webViewStackViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var weContent: UIWebView!
    
    
    typealias Item = (text: String, html: String, des: String, link: String)
    
    // current document
    var document: Document = Document.init("")
    // item founds
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadHTML()
//        weContent.loadRequest(URLRequest(url: URL(string: "https://vnexpress.net/thoi-su/chinh-phu-rut-de-xuat-nghi-le-vao-27-7-3937577.html")!))
    }
    
    
}

extension webViewStackViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "sugestion \(indexPath.row)"
        return cell
    }
    
}

extension webViewStackViewViewController {
    func downloadHTML() {
        // url string to URL
        guard let url = URL(string: "https://vnexpress.net/thoi-su/chinh-phu-rut-de-xuat-nghi-le-vao-27-7-3937577.html") else {
            // an error occurred
            UIAlertController.showAlert("Error: doesn't seem to be a valid URL", self)
            return
        }
        
        do {
            // content of url
            let html = try String.init(contentsOf: url)
            // parse it into a Document
            document = try SwiftSoup.parse(html)
            // parse css query
            parse()
        } catch let error {
            // an error occurred
            UIAlertController.showAlert("Error: \(error)", self)
        }
        
    }
    
    //Parse CSS selector
    func parse() {
        do {
            let elements: Elements = try document.select("section").select("section")
            for element in elements {
                for section in try element.select("section").array() {
                    let attrClass = try section.attr("class")
                    print(try section.outerHtml())
                    if attrClass == "sidebar_1" {
                        // tự build show content webview
                        //                        for item in try section.select("h1"){
                        //                            print("==>>h1: \(item.ownText())")
                        //                        }
                        //                        for item in try section.select("p"){
                        //                            print("==>>p: \(item)")
                        //                        }
                        
                        let a =  try section.outerHtml()
                        print("==>> a: \(a)")
                    }
                }
            }
            
        } catch let error {
            UIAlertController.showAlert("Error: \(error)", self)
        }
        tableView.reloadData()
    }
}


protocol Element {
    var text: String? { get set }
}

class Title: Element {
    var text: String?
}

class Page: Element {
    var text: String?
    
}

class Image: Element {
    var text: String?
    
}

class Auth: Element {
    var text: String?
    
}

class BrifInfo: Element {
    var text: String?
    
}
