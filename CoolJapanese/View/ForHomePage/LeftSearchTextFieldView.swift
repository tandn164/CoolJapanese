//
//  HeaderBackgroundView.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/6/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class LeftSearchTextFieldView: UIView {

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
        backgroundColor = UIColor(named: "SearchField")
        roundCorners(corners: [.topLeft, .bottomLeft], radius: 10.0)
        
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat)
    {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
