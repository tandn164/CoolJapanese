//
//  WordView.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class WordView: UIView {

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
        backgroundColor = .white
        layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.671, green: 0.665, blue: 0.665, alpha: 1).cgColor
    }
}
