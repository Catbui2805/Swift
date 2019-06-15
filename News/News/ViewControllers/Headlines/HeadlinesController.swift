//
//  HeadlinesViewController.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/14/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit
import Parchment

class HeadlinesViewController: UIViewController {
    fileprivate let cities = [
        "Oslo",
        "Stockholm",
        "Tokyo",
        "Barcelona",
        "Vancouver",
        "Berlin",
        "Shanghai",
        "London",
        "Paris",
        "Chicago",
        "Madrid",
        "Munich",
        "Toronto",
        "Sydney",
        "Melbourne"
    ]
    
    
    var city: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        
//
        let pagingViewController = PagingViewController<PagingIndexItem>()
        pagingViewController.dataSource = self
        pagingViewController.delegate = self
        
        // Add the paging view controller as a child view controller and
        // contrain it to all edges.
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
    }
    
}

// MARK: - Setup
extension HeadlinesViewController {
    func setupNavigationController() {
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_black"),
                                                style: .plain, target: self, action: #selector(btSearchAction))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationItem.title = "Headlines"
        
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

extension HeadlinesViewController: PagingViewControllerDataSource {
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, pagingItemForIndex index: Int) -> T {
        return PagingIndexItem(index: index, title: cities[index]) as! T
    }
    
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, viewControllerForIndex index: Int) -> UIViewController {
//        return CityViewController(title: cities[index])
        return ForYouViewController()
    }
    
    func numberOfViewControllers<T>(in: PagingViewController<T>) -> Int {
        return cities.count
    }
    
}

extension HeadlinesViewController: PagingViewControllerDelegate {
    
    // We want the size of our paging items to equal the width of the
    // city title. Parchment does not support self-sizing cells at
    // the moment, so we have to handle the calculation ourself. We
    // can access the title string by casting the paging item to a
    // PagingTitleItem, which is the PagingItem type used by
    // FixedPagingViewController.
    func pagingViewController<T>(_ pagingViewController: PagingViewController<T>, widthForPagingItem pagingItem: T, isSelected: Bool) -> CGFloat? {
        guard let item = pagingItem as? PagingIndexItem else { return 0 }
        
        let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: pagingViewController.menuItemSize.height)
        let attributes = [NSAttributedString.Key.font: pagingViewController.font]
        
        let rect = item.title.boundingRect(with: size,
                                           options: .usesLineFragmentOrigin,
                                           attributes: attributes,
                                           context: nil)
        
        let width = ceil(rect.width) + insets.left + insets.right
        
        if isSelected {
            return width * 1.5
        } else {
            return width
        }
    }
    
}
