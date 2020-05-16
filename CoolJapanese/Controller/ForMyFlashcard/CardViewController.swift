//
//  FlashcardViewController.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/12/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import Foundation
class CardViewController: UIViewController{
    
//  MARK: IBOutlet
    
    @IBOutlet weak var frontStarImage: UIImageView!
    @IBOutlet weak var numberOfWords: UILabel!
    @IBOutlet weak var wordView: FlashcardWordView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wordNoteLabel: UILabel!
    
//  MARK: Variable
    
    var maindata : Flashcard!
    var index = 0
    var wordContent = ""
    var wordNoteContent = ""
    var remembered = false
    
// MARK: View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        numberOfWords.text = "\(index+1)/\(maindata.total)"
        wordLabel.text = wordContent
        wordNoteLabel.text = wordNoteContent
        if remembered {
            frontStarImage.tintColor = UIColor(named: TextColor.Green)
        } else
        {
            frontStarImage.tintColor = .systemGray4
        }
        viewTapped()
        starTapped()
    }
    
}

//  MARK: View's Gesture
extension CardViewController {
    
    func viewTapped()
    {
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeWordView))
        Tap.name = "viewTapped"
        Tap.delegate = self
        self.wordView.addGestureRecognizer(Tap)
    }
    
    @objc func changeWordView()
    {
        UIView.transition(with: self.wordView, duration: 0.3, options: [.transitionFlipFromLeft], animations: {
            self.wordLabel.isHidden = !self.wordLabel.isHidden
            self.wordNoteLabel.isHidden = !self.wordNoteLabel.isHidden
               }, completion: nil)
    }
    
    func starTapped()
    {
        print(69)
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeStarColor))
        Tap.name = "starTapped"
        Tap.delegate = self
        self.frontStarImage.addGestureRecognizer(Tap)
    }
    
    @objc func changeStarColor()
    {
        print(77)
        if frontStarImage.tintColor == .systemGray4{
            frontStarImage.tintColor = UIColor(named: TextColor.Green)
        } else {
            frontStarImage.tintColor = .systemGray4
        }
    }
    
}

//  MARK: GestureRecognizerdelegate

extension CardViewController: UIGestureRecognizerDelegate{
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {

        if gestureRecognizer.name == "viewTapped"
        {
            if touch.view?.isDescendant(of: frontStarImage) == true{
                return false
            }
        }
        return true
    }
}

