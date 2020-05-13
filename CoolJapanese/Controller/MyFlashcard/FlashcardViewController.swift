//
//  FlashcardViewController.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/12/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import Foundation
class FlashcardViewController: UIViewController{
    @IBOutlet weak var frontStarImage: UIImageView!
    @IBOutlet weak var numberOfWords: UILabel!
    @IBOutlet weak var wordView: FlashcardWordView!
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wordNoteLabel: UILabel!
    var maindata : Flashcard!
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfWords.text = "\(maindata.learned)/\(maindata.total)"
        viewTapped()
    }
    func viewTapped(){
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeWordView))
        self.wordView.addGestureRecognizer(Tap)
    }
    @objc func changeWordView(){
        UIView.transition(with: self.wordView, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
            self.wordLabel.isHidden = !self.wordLabel.isHidden
            self.wordNoteLabel.isHidden = !self.wordNoteLabel.isHidden
               }, completion: nil)
        
        
    }
}


