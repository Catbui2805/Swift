//
//  ViewController.swift
//  LifeCycle
//
//  Created by Nguyen Tran Cong on 5/18/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// ViewLoad
    /*
     1. đc gọi khi khỏi tạo 1 viewcontroller
     2. mục đích dùng để khơi tạo UI
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         - khi viewcontroller đc nap vào bộ nhớ (điều kiện là viewcontroller này chưa tồn tại trong bộ nhớ)
         - Chỉ đc gọi một lần duy nhất trong chu kỳ sống của view
         - Thường dùng để chuẩn bị data hoặc là khởi tạo các gía trj mặc định cho các object cũng UI trên màn hình
         */
        
        print(" 1. view 1 --->> func viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /*
         - Hàm sẽ đc gọi trước khi một view đc thêm vào hệ thống view và animation hiển thị một view.
         - Tại thời điểm  animation để hiển thị view thì nếu bạn muốn tuỳ chỉnh gì thì hàm này sẽ giúp bạn tuỳ chỉnh
         */
        
        print(" 2. view 1 --->> func viewWillAppear(_ animated: Bool)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
         - Hàm sẽ đc gọi khi một view đã đc thêm vào hệ thống view và đã hiển thị lên màn hình
         */
        
        print(" 3. view 1 --->> func viewDidAppear(_ animated: Bool)")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
         - Được gọi khi một view đã đc ẩn khỏi màm hình và animation khi ẩn view đó
         */
        
        print(" 4. view 1 --->> func viewWillDisappear(_ animated: Bool)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /*
         - Gọi khi một view đã ẩn khỏi màm hình
         */
        print(" 5. view 1 --->> func viewDidDisappear(_ animated: Bool)")
    }
}

