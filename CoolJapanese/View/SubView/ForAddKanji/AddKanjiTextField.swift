//
//  AddKanjiTextField.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class AddKanjiTextField: UITextField {

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
        attributedPlaceholder = NSAttributedString(string: "Type a word", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: Colorset.AddKanjiBackground)!])
        layer.cornerRadius = 22
    }
}
