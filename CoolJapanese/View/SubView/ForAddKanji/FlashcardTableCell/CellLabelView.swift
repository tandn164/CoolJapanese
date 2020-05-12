//
//  CellLabelView.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class CellLabelView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    func setupView(){
        backgroundColor = .white
        layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer.cornerRadius = frame.height/2
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.671, green: 0.665, blue: 0.665, alpha: 1).cgColor
    }
}
