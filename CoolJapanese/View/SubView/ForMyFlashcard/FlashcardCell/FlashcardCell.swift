//
//  FlashcardCell.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/8/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit
import UICircularProgressRing
class FlashcardCell: UITableViewCell {
    @IBOutlet weak var progressRing: UICircularProgressRing!
    static let FlashcardCellID = "FlashcardCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        progressRing.style = .dashed(pattern: [2,2])
        progressRing.innerCapStyle = .butt
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
