//
//  ViewController.swift
//  Vnexpress
//
//  Created by Nguyen Tran Cong on 5/24/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var rssItems: [RSSItem]?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 155.0
        fetchData()
    }
    
    private func fetchData() {
        let feedParser = FeedParser()
        feedParser.parserFeed(url: "https://vnexpress.net/rss/cuoi.rss") { (rssItem) in
            self.rssItems = rssItem
            
            OperationQueue.main.addOperation {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .left)
                self.tableView.reloadData()
            }
        }
    }
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rssItems = rssItems else {
            return 0
        }
        return rssItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        if let item = rssItems?[indexPath.item] {
            cell.item = item
        }
        return cell
    }
    
    
}

