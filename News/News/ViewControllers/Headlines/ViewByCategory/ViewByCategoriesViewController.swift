//
//  ViewByCategoriesViewController.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/16/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class ViewByCategoriesViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }

}

extension ViewByCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}




