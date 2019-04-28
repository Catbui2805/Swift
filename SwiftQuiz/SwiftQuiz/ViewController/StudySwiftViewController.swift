//
//  StudySwiftViewController.swift
//  SwiftQuiz
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class StudySwiftViewController: UIViewController {

    @IBOutlet weak var web: UIWebView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuLayoutConstraint: NSLayoutConstraint!
    
    var isShowingMenu = false
    var data = DataService()
    var tutorials = [TutorialModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorials = data.getTutorails()
        menuLayoutConstraint.constant = -260
        menuView.layer.shadowRadius = 6
        menuView.layer.shadowOpacity = 1
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension StudySwiftViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorials.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(tutorials[indexPath.row].name)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(tutorials[indexPath.row].link ?? "")")
        let url = URL (string: "\(tutorials[indexPath.row].link ?? "google.com")")
        let requestObj = URLRequest(url: url!)
        web.loadRequest(requestObj)
        self.navigationItem.title = "\(tutorials[indexPath.row].name)"
    }
    
}

// MARK: - Side Menu
extension StudySwiftViewController {
    @IBAction func openMenu(_ sender: Any) {
        if isShowingMenu {
            menuLayoutConstraint.constant = -260
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            menuLayoutConstraint.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        isShowingMenu = !isShowingMenu
    }
    
    @IBAction func swipeGestureLeftMenu(_ sender: Any) {
        if !isShowingMenu {
            menuLayoutConstraint.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            isShowingMenu = !isShowingMenu
        }
    }
    
    @IBAction func gestureDoubleTapped(_ sender: Any) {
        if isShowingMenu {
            menuLayoutConstraint.constant = -260
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            isShowingMenu = !isShowingMenu
        }
    }
}
