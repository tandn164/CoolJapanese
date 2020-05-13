//
//  MyFlashcardViewController.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit
class MyFlashcardViewController: UIViewController{
    
    @IBOutlet weak var flashcardTable: UITableView!
    
    @IBOutlet weak var flashcardName: UITextField!
    @IBOutlet weak var FlashcardListView: FlashcardListView!
    var flashcardData : [Flashcard] = []
    var dataToPass: Flashcard!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIGestureRecognizer().delegate = self
        hideKeyboard()
        addExitOnTap()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: Colorset.MyFlashcardBar)
        setupTableView()
    }
    func setupTableView(){
        flashcardTable.register(UINib(nibName: FlashcardCell.FlashcardCellID, bundle: nil), forCellReuseIdentifier: FlashcardCell.FlashcardCellID)
        flashcardData = [Flashcard(name: "All", check: true,learned: 10, total: 100,color: "green"),Flashcard(name: "JLPT N3", check: false,learned: 70,total: 100,color: "red")]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdent.viewFlashcard{
            let destinationMV = segue.destination as! FlashcardViewController
            destinationMV.maindata = dataToPass
        }
    }
}
extension MyFlashcardViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flashcardData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FlashcardCell.FlashcardCellID, for: indexPath) as? FlashcardCell
        {
            cell.flashCard = flashcardData[indexPath.row]
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}
//--------------------------------------------------------------------------------
//  MARK: - TableView Delegate
//--------------------------------------------------------------------------------
extension MyFlashcardViewController: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
//--------------------------------------------------------------------------------
//  MARK: - TextField Delegate
//--------------------------------------------------------------------------------
extension MyFlashcardViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.flashcardName.endEditing(true)
        return false
    }
}
//--------------------------------------------------------------------------------
//  MARK: - Custom Gesture
//--------------------------------------------------------------------------------
extension MyFlashcardViewController{
    func addExitOnTap(){
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissView))
        Tap.delegate = self
        Tap.name = MyFlashcardIdent.exitOnTap
        self.view.addGestureRecognizer(Tap)

    }
    @objc func DismissView(){
        DismissKeyboard()
        FlashcardListView.isHidden = true
        flashcardTable.isUserInteractionEnabled = true
    }
    func hideKeyboard(){
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        Tap.delegate = self
        Tap.name = MyFlashcardIdent.hideKeyboard
        self.view.addGestureRecognizer(Tap)
    }
    @objc func DismissKeyboard(){
        flashcardName.endEditing(true)
    }
}
//--------------------------------------------------------------------------------
//  MARK: - Button Action
//--------------------------------------------------------------------------------
extension MyFlashcardViewController{
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        if FlashcardListView.isHidden {
            FlashcardListView.isHidden = false
            flashcardTable.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func colorButton(_ sender: UIButton) {
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        DismissKeyboard()
        DismissView()
    }
}
//--------------------------------------------------------------------------------
//  MARK: - UIGesture Delegate
//--------------------------------------------------------------------------------
extension MyFlashcardViewController: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if gestureRecognizer.name == MyFlashcardIdent.exitOnTap{
            if touch.view?.isDescendant(of: FlashcardListView) == true {
                return false
            }
        }
        return true
    }
}


extension MyFlashcardViewController: FlashcardCellDelegate{
    func didTapped(_ data: Flashcard) {
        dataToPass = data
        performSegue(withIdentifier: segueIdent.viewFlashcard, sender: self)
    }
}
