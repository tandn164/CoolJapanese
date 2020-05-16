//
//  FlashcardWordView.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/12/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class FlashcardWordView: UIView {

//  MARK: Init method
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        setUpView()
    }
    
//  MARK: Setup View
    
    func setUpView()
    {
        layer.cornerRadius = 20
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        layer.shadowRadius = 20
        layer.shadowOpacity = 1
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
}
