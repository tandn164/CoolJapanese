//
//  MyFlashcardViewController.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit
class MyFlashcardViewController: UIViewController {
    
//  MARK: IBOutlet
    
    @IBOutlet weak var flashcardTable: UITableView!
    @IBOutlet weak var flashcardName: UITextField!
    @IBOutlet weak var FlashcardListView: FlashcardListView!
    
//  MARK: variable
    
    var dataToPass: Flashcard!
    
    let flashcardData = [Flashcard(name: "All", check: true,learned: 2, total: 5,color: "green",words: [Word(remember: false, content: "あ", note: "first letter of Hiragana"),Word(remember: true, content: "い", note: "second letter of Hiragana"),Word(remember: false, content: "う", note: "third letter of Hiragana"),Word(remember: false, content: "え", note: "fouth letter of Hiragana"),Word(remember: true, content: "お", note: "fifth letter of Hiragana")]),Flashcard(name: "JLPT N3", check: false,learned: 1,total: 2,color: "red",words: [Word(remember: true, content: "い", note: "second letter of Japanese"),Word(remember: false, content: "え", note: "fouth letter of Hiragana")])]
    
//  MARK: View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        UIGestureRecognizer().delegate = self
        hideKeyboard()
        addExitOnTap()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: BarColor.MyFlashcardBar)
        setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == SegueIdent.viewFlashcard{
            let destinationMV = segue.destination as! FlashcardViewController
            destinationMV.maindata = dataToPass
        }
    }
    
}

//  MARK: Tableview Delegate

extension MyFlashcardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView()
    {
        flashcardTable.register(UINib(nibName: FlashcardCell.FlashcardCellID, bundle: nil), forCellReuseIdentifier: FlashcardCell.FlashcardCellID)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return flashcardData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FlashcardCell.FlashcardCellID, for: indexPath) as? FlashcardCell
        {
            cell.flashCard = flashcardData[indexPath.row]
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
}

//  MARK: - TextField Delegate

extension MyFlashcardViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.flashcardName.endEditing(true)
        return false
    }
    
}

//  MARK: - Custom Gesture

extension MyFlashcardViewController {
    
    func addExitOnTap()
    {
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        Tap.delegate = self
        Tap.name = MyFlashcardIdent.exitOnTap
        self.view.addGestureRecognizer(Tap)
    }
    
    @objc func dismissView()
    {
        dismissKeyboard()
        FlashcardListView.isHidden = true
        flashcardTable.isUserInteractionEnabled = true
    }
    
    func hideKeyboard()
    {
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        Tap.delegate = self
        Tap.name = MyFlashcardIdent.hideKeyboard
        self.view.addGestureRecognizer(Tap)
    }
    
    @objc func dismissKeyboard()
    {
        flashcardName.endEditing(true)
    }
    
}

//  MARK: - Button Action

extension MyFlashcardViewController {
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem)
    {
        if FlashcardListView.isHidden {
            FlashcardListView.isHidden = false
            flashcardTable.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func colorButton(_ sender: UIButton)
    {
        
    }
    
    @IBAction func doneButton(_ sender: UIButton)
    {
        dismissKeyboard()
        dismissView()
    }
    
}
//  MARK: - UIGesture Delegate

extension MyFlashcardViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if gestureRecognizer.name == MyFlashcardIdent.exitOnTap{
            if touch.view?.isDescendant(of: FlashcardListView) == true {
                return false
            }
        }
        return true
    }
    
}

//  MARK: - FlashcardCellDelegate

extension MyFlashcardViewController: FlashcardCellDelegate {
    
    func didTapped(_ data: Flashcard)
    {
        dataToPass = data
        print(141)
        performSegue(withIdentifier: SegueIdent.viewFlashcard, sender: self)
    }
    
}
