//
//  ViewController.swift
//  SwiftSoupHTML
//
//  Created by Nguyen Tran Cong on 5/28/19.
//  Copyright © 2019 com.devideep. All rights reserved.
//

import UIKit
import SwiftSoup
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    typealias Item = (text: String, html: String, des: String)
    
    // current document
    var document: Document = Document.init("")
    // item founds
    var items: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        downloadHTML()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostTableViewCell
        cell.titleText.text = items[indexPath.row].text
        cell.descriptionText.text = items[indexPath.row].des
        cell.dateText.text = items[indexPath.row].html
        print("===>> url image \(items[indexPath.row].html)")
        let url = URL(string: items[indexPath.row].html)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.picture.image = UIImage(data: data!)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370
    }
    
}

extension ViewController {
    func downloadHTML() {
        // url string to URL
        guard let url = URL(string: "https://vnexpress.net/") else {
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
            let elements: Elements = try document.select("article")
            //transform it into a local object (Item)
            for element in elements {
                let text = try element.text()
                if text == "" || text.isEmpty {
                    continue
                }
                var aa = ""
                let html = try element.outerHtml()
                let description = try element.select("p").first()?.text() ?? ""
                print("element =>> \(element)")
                for a in try element.select("img").array() {
                    aa = try a.attr("data-original")
                }
                items.append(Item(text: text, html: aa, des: description))
            }
            
        } catch let error {
            UIAlertController.showAlert("Error: \(error)", self)
        }
        tableView.reloadData()
    }
}

extension UIAlertController {
    static public func showAlert(_ message: String, _ controller: UIViewController) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
