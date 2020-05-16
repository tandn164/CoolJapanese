//
//  FlashcardListView.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class FlashcardListView: UIView {
    
//  MARK: Init method

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        setupView()
    }

//  MARK: Setpu View
    
    func setupView()
    {
        layer.cornerRadius = 20
        setShadow()
    }
    
    private func setShadow()
    {
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        layer.shadowRadius = 100
        layer.shadowOpacity = 1
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
