//
//  ViewController.swift
//  FeedKitVnExpress
//
//  Created by Nguyen Tran Cong on 5/25/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data: [HomeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData()
    }

}

private extension ViewController {
    func getData() {
        let trangChu = HomeModel(title: "Trang Chủ", link: "https://vnexpress.net/rss/tin-moi-nhat.rss")
        self.data.append(trangChu)
        
        let thoiSu = HomeModel(title: "Thời sự", link: "https://vnexpress.net/rss/thoi-su.rss")
        self.data.append(thoiSu)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(data[indexPath.row].title)
        print(data[indexPath.row].link)
        
        let sb = UIStoryboard(name: "CategoryViewController", bundle: nil)
        let categories = sb.instantiateInitialViewController() as! CategoryViewController
        
        categories.title = data[indexPath.row].title
        categories.link = data[indexPath.row].link
        
        navigationController?.pushViewController(categories, animated: true)
    }
}
