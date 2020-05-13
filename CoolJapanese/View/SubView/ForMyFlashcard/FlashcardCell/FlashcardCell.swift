//
//  FlashcardCell.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/8/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit
import UICircularProgressRing
protocol FlashcardCellDelegate {
    func didTapped(_ data: Flashcard)
}
class FlashcardCell: UITableViewCell {
    @IBOutlet weak var progressRing: UICircularProgressRing!
    @IBOutlet weak var blurImage: UIImageView!
    @IBOutlet weak var learnedPercent: UILabel!
    @IBOutlet weak var flashcardName: UILabel!
    @IBOutlet weak var totalWords: UILabel!
    var delegate : FlashcardCellDelegate?
    static let FlashcardCellID = "FlashcardCell"
    var flashCard: Flashcard!{
        didSet{
            UpdateUI()
        }
    }
    func UpdateUI(){
        progressRing.style = .dashed(pattern: [2,2])
        progressRing.innerCapStyle = .butt
        progressRing.value = CGFloat(Float(flashCard.learned)/Float(flashCard.total)*100)
        print(flashCard.learned)
        print(flashCard.total)
        learnedPercent.text = "\(Float(flashCard.learned)/Float(flashCard.total)*100) %"
        totalWords.text = "\(flashCard.total) words"
        flashcardName.text = flashCard.name
        setFlashcardColor(flashCard.color)
    }
    func setFlashcardColor(_ color: String){
        switch color {
        case "green":
            blurImage.image = UIImage(named: "GreenFlashcard")
            flashcardName.textColor = UIColor(named: "GreenTextColor")
            progressRing.innerRingColor = UIColor(named: "GreenTextColor")!
            progressRing.outerRingColor = UIColor(named: "GreenLightColor")!
            learnedPercent.textColor = UIColor(named: "GreenTextColor")
            totalWords.textColor = UIColor(named: "GreenTextColor")
        case "red":
            blurImage.image = UIImage(named: "RedFlashcard")
            flashcardName.textColor = UIColor(named: "RedTextColor")
            progressRing.innerRingColor = UIColor(named: "RedTextColor")!
            progressRing.outerRingColor = UIColor(named: "RedLightColor")!
            learnedPercent.textColor = UIColor(named: "RedTextColor")
            totalWords.textColor = UIColor(named: "RedTextColor")
        default:
            break
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.cellTapped(_:)))
        // Initialization code
        self.addGestureRecognizer(labelTap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func cellTapped(_ sender: UITapGestureRecognizer)
    {
        self.delegate?.didTapped(self.flashCard)
    }
}
