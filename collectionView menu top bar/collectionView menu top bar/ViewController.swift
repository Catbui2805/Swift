//
//  ViewController.swift
//  collectionView menu top bar
//
//  Created by Nguyen Tran Cong on 6/4/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var btMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        self.collectionView.register(UINib(nibName: "MenuTopCollectionViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: "MenuTopCell")
    }

    
    
    @IBAction func btMenuAction(_ sender: UIButton) {
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuTopCell", for: indexPath) as! MenuTopCollectionViewCell
        
        cell.categoryName.text = "category \(indexPath.row)"
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}

