//
//  AddWordButton.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class AddWordButton: UIButton {
    
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
//  MARK: Setup View
    
    func setupView()
    {
        layer.cornerRadius = 20
    }
    
}
