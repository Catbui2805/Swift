//
//  CategoryViewController.swift
//  FeedKitVnExpress
//
//  Created by Nguyen Tran Cong on 5/25/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit
import FeedKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var textTitle: String = ""
    var link: String = ""
    
    var data = [HomeModel]()
    
    
    var feed: RSSFeed?
    
    var feedURL: URL?
    var parser: FeedParser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = textTitle
        
        feedURL = URL(string: link)
        parser = FeedParser(URL: feedURL!)
        
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
}

private extension CategoryViewController {
    func loadData() {
        parser?.parseAsync {[weak self] (result) in
            self?.feed = result.rssFeed
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoryTableViewCell
        data.append(HomeModel(title: (feed?.items![indexPath.row].title)!, link: (feed?.items![indexPath.row].link)!))
        cell.titleLabel.text = feed?.items![indexPath.row].title
        cell.dateLabel.text = "\(feed?.items![indexPath.row].pubDate)"
        cell.descriptionLabel.text = feed?.items![indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "DetailViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! DetailViewController
        vc.title = data[indexPath.row].title
        vc.link = data[indexPath.row].link
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
