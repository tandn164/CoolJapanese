//
//  AddKanjiController.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/7/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit
class AddKanjiController: UIViewController {
    
//  MARK: IBOutlet
    
    @IBOutlet weak var drawableParentView: UIView!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    @IBOutlet weak var drawableView: DrawableView!
    @IBOutlet weak var wordView: UILabel!
    @IBOutlet weak var flashcardListView: FlashcardListView!
    @IBOutlet weak var flashcardTableInsideListView: UITableView!
    @IBOutlet weak var wordField: AddKanjiTextField!
    @IBOutlet weak var wordNoteField: UITextView!
    @IBOutlet weak var addWordButton: UIButton!
    
//  MARK: Variable
    
    let flashcardData = [Flashcard(),Flashcard()]
    private lazy var viewModel: HandwritingViewModel = {
        let vm = HandwritingViewModel(canvas: drawableView)
        return vm
    }()
    
//  MARK: App Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
        resultCollectionView.layer.borderWidth = 1
        resultCollectionView.layer.borderColor = UIColor.blue.cgColor
        drawableView.delegate = self
        viewModel.resultUpdated = { [weak self]() in
            self?.resultCollectionView.reloadData()
        }
        wordView.adjustsFontSizeToFitWidth = true
    }
    
    func setupTableView()
    {
        flashcardTableInsideListView.backgroundView?.backgroundColor = .white
        flashcardTableInsideListView.backgroundColor = .white
        flashcardTableInsideListView.sectionIndexBackgroundColor = .white
        flashcardTableInsideListView.register(UINib(nibName: FlashcardTableCell.FlashcardTableCellID, bundle: nil), forCellReuseIdentifier: FlashcardTableCell.FlashcardTableCellID)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: BarColor.AddKanjiBar)
        setupTableView()
    }
    
}

//  MARK: UICollectionView delegate

extension AddKanjiController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath) as? HandwritingCollectionViewCell
        wordView.text = cell?.resultLabel.text
        dismissView()
    }
        
    func collectionView(_ view: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return viewModel.resultCount()
    }
    
    func collectionView(_ view: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = view.dequeueReusableCell(withReuseIdentifier: CellIdent.viewCell, for: indexPath) as! HandwritingCollectionViewCell
        
        cell.resultLabel.text = viewModel.result(atIndex: indexPath.item)
        return cell
    }
    
}

//  MARK: DrawableView delegate

extension AddKanjiController: DrawableViewDelegate {
    
    func didDraw(stroke: [NSValue])
    {
        viewModel.add(stroke)
    }
    
}

//  MARK: TableView delegate

extension AddKanjiController: UITableViewDelegate, UITableViewDataSource {
    
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
        if let cell = flashcardTableInsideListView.dequeueReusableCell(withIdentifier: FlashcardTableCell.FlashcardTableCellID, for: indexPath) as? FlashcardTableCell
        {
            cell.label.text = flashcardData[indexPath.row].name
           // cell.cellSwitch.isOn = flashcardData[indexPath.row].check
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 66
    }
}

//  MARK: - TextField Delegate

extension AddKanjiController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        drawableParentView.isHidden = true
        hideKeyboard()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        self.wordView.text = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.wordField.endEditing(true)
        return false
    }
    
}

//  MARK: - TextView Delegate

extension AddKanjiController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        drawableParentView.isHidden = true
        hideKeyboard()
    }
    
}

//  MARK: - Custom Gesture

extension AddKanjiController {
    
    func hideKeyboard()
    {
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        Tap.delegate = self
        Tap.name = AddKanjiIdent.hideKeyboard
        self.view.addGestureRecognizer(Tap)
    }
    
    @objc func dismissKeyboard()
    {
        wordField.endEditing(true)
        wordNoteField.endEditing(true)
        self.view.gestureRecognizers?.removeAll()
    }
    
    func hideDrawboard()
    {
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        Tap.delegate = self
        Tap.name = AddKanjiIdent.hideDrawboard
        self.view.addGestureRecognizer(Tap)
    }
    
    @objc func dismissView()
    {
        drawableParentView.isHidden = true
        drawableView.clear()
        viewModel.clear()
        self.view.gestureRecognizers?.removeAll()
    }
    
    func exitOnTap()
    {
        let Tap : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideListView))
        Tap.delegate = self
        Tap.name = AddKanjiIdent.exitOnTap
        self.view.addGestureRecognizer(Tap)
    }
    
    @objc func hideListView()
    {
        flashcardListView.isHidden = true
        wordField.isUserInteractionEnabled = true
        addWordButton.isUserInteractionEnabled = true
        self.view.gestureRecognizers?.removeAll()
    }
    
}

//  MARK: - UIGesture Delegate

extension AddKanjiController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool
    {
        if gestureRecognizer.name == AddKanjiIdent.hideDrawboard{
            if touch.view?.isDescendant(of: drawableParentView) == true {
                return false
            }
        }
        if gestureRecognizer.name == AddKanjiIdent.exitOnTap{
            if touch.view?.isDescendant(of: flashcardListView) == true {
                return false
            }
        }
        return true
    }
    
}

//  MARK: - Button Action

extension AddKanjiController {
    
    @IBAction func drawButtonPressed(_ sender: UIButton)
    {
        if drawableParentView.isHidden{
            drawableParentView.isHidden = false
            dismissKeyboard()
            hideDrawboard()
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton)
    {
        drawableView.clear()
        viewModel.clear()
    }
    
    @IBAction func undoButtonPressed(_ sender: UIButton)
    {
        drawableView.undo()
        viewModel.clear()
        let strokes = drawableView.strokes.map { $0 as! [NSValue] }
        if strokes.count > 0 {
            viewModel.add(strokes)
        }
    }
    
    @IBAction func addWordButtonPressed(_ sender: AddWordButton)
    {
        if flashcardListView.isHidden {
            flashcardListView.isHidden = false
            wordField.isUserInteractionEnabled = false
            addWordButton.isUserInteractionEnabled = false
            exitOnTap()
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton)
    {
        hideListView()
    }
    
}
