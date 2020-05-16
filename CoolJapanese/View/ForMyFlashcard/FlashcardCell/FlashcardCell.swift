//
//  FlashcardCell.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/8/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit
import UICircularProgressRing

//  MARK: FlashcardCellDelegate

protocol FlashcardCellDelegate {
    func didTapped(_ data: Flashcard)
}

class FlashcardCell: UITableViewCell {
    
//  MARK: IBOutlet
    
    @IBOutlet weak var progressRing: UICircularProgressRing!
    @IBOutlet weak var blurImage: UIImageView!
    @IBOutlet weak var learnedPercent: UILabel!
    @IBOutlet weak var flashcardName: UILabel!
    @IBOutlet weak var totalWords: UILabel!
    
//  MARK: Variable
    
    var delegate : FlashcardCellDelegate?
    static let FlashcardCellID = "FlashcardCell"
    var flashCard: Flashcard!{
        didSet{
            UpdateUI()
        }
    }

//  MARK: Setup View
    
    func UpdateUI()
    {
        progressRing.style = .dashed(pattern: [2,2])
        progressRing.innerCapStyle = .butt
        progressRing.value = CGFloat(Float(flashCard.learned)/Float(flashCard.total)*100)
        learnedPercent.text = "\(Float(flashCard.learned)/Float(flashCard.total)*100) %"
        totalWords.text = "\(flashCard.total) words"
        flashcardName.text = flashCard.name
        setFlashcardColor(flashCard.color)
    }
    
    func setFlashcardColor(_ color: String)
    {
        switch color {
        case "green":
            blurImage.image = UIImage(named: FlashcardBackground.Green)
            flashcardName.textColor = UIColor(named: TextColor.Green)
            progressRing.innerRingColor = UIColor(named: TextColor.Green)!
            progressRing.outerRingColor = UIColor(named: TextColor.GreenLight)!
            learnedPercent.textColor = UIColor(named: TextColor.Green)
            totalWords.textColor = UIColor(named: TextColor.Green)
        case "red":
            blurImage.image = UIImage(named: FlashcardBackground.Red)
            flashcardName.textColor = UIColor(named: TextColor.Red)
            progressRing.innerRingColor = UIColor(named: TextColor.Red)!
            progressRing.outerRingColor = UIColor(named: TextColor.RedLight)!
            learnedPercent.textColor = UIColor(named: TextColor.Red)
            totalWords.textColor = UIColor(named: TextColor.Red)
        default:
            break
        }
    }
    
//  MARK: View Lifecycle
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.cellTapped(_:)))
        self.addGestureRecognizer(labelTap)
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func cellTapped(_ sender: UITapGestureRecognizer)
    {
        self.delegate?.didTapped(self.flashCard)
    }
    
}
