//
//  ProcessViewController.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit
class ProcessViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: Colorset.LearningProcessBar)        
    }
}

