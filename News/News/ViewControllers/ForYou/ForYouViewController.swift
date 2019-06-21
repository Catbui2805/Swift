//
//  ForYouViewController.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/14/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class ForYouViewController: UIViewController {

    let home: HeadlinesRepoable = Headlines()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        home.getNewsArticle(page: 1, pageSize: 10) { (result, error) in
            guard let result  = result else {
                return
            }
            print(result)
            print(error)
        }
        setupNavigationController()
    }


    func setupNavigationController() {
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_black"),
                                                style: .plain, target: self, action: #selector(btSearchAction))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationItem.title = "For You"
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "account_circle_black"),
                                                 style: .plain, target: self, action: #selector(btAccountAction))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    
    @objc func btSearchAction() {
        print("Button search !")
    }
    
    @objc func btAccountAction() {
        print("Button btAccountAction !")
    }
}

