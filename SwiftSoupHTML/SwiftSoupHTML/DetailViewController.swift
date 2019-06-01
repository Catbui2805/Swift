//
//  DetailViewController.swift
//  SwiftSoupHTML
//
//  Created by Nguyen Tran Cong on 5/30/19.
//  Copyright © 2019 com.devideep. All rights reserved.
//

import UIKit
import SwiftSoup
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var web: UIWebView!
    
    var contentString: String = ""
    
    typealias Item = (text: String, html: String)
    // current document
    var document: Document = Document.init("")
    // item founds
    var items: [Item] = []
    
    var urlString: String = "https://vnexpress.net/bong-da/hlv-thai-lan-toi-hieu-rat-ro-cac-cau-thu-viet-nam-3931436.html"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadHTML()
    }
    
    func loadWebView(content: String) {
        let htmlCode = "<html><head><style> body { font-size: 150%; } </style><title>Wonderful web</title></head> <body>\(content)</body>"
        
        web.loadHTMLString(htmlCode, baseURL: nil)
    }

}

extension DetailViewController {
    func downloadHTML() {
        // url string to URL
        guard let url = URL(string: urlString) else {
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
            //empty old items
            items = []
            // firn css selector
            let elements: Elements = try document.select("section")
            //transform it into a local object (Item)
            for element in elements {
                var text = ""
//                let text = try element.text()
//                if text == "" || text.isEmpty {
//                    continue
//                }
                var aa = ""
//                let html = try element.outerHtml()
//                let description = try element.select("p").first()?.text() ?? ""
//                print("element =>> \(element)")
                for a in try element.select("section").array() {
//                    print("element a =>> \(a)")
                    aa = try a.attr("class")
                    if aa == "sidebar_1" {
                        print("===>> sidebar_1 == \(a)")
                        contentString = try a.outerHtml()
                    }
                }
                items.append(Item(text: text, html: aa))
            }
            
        } catch let error {
            UIAlertController.showAlert("Error: \(error)", self)
        }
        
        loadWebView(content: contentString)
//        webShow.
    }
}
