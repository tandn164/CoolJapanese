//
//  ViewController.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/6/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class HomePageController: UIViewController {
    @IBOutlet weak var popUpMenuView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
    }
    
        
    
}
//--------------------------------------------------------------------------------
//  MARK: - Button Action
//--------------------------------------------------------------------------------
extension HomePageController{
    @IBAction func quitPopupButton(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.popUpMenuView.isHidden = true
        }, completion: nil)
    }
    @IBAction func PopUpMenu(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.popUpMenuView.isHidden = false
        }, completion: nil)
    }
}


