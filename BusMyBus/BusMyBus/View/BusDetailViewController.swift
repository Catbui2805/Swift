//
//  BusDetailViewController.swift
//  BusMyBus
//
//  Created by Nguyen Tran Cong on 5/2/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class BusDetailViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension BusDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BusDetailCollectionViewCell
        cell.title.text = "\(indexPath.row)"
        cell.discription.text = "duong \(indexPath.row)"
        if cell == nil {
            cell = UICollectionViewCell() as! BusDetailCollectionViewCell
        }
        return cell
    }
    
}
