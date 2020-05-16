//
//  FlshcardViewController.swift
//  CoolJapanese
//
//  Created by Nguyễn Đức Tân on 5/14/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class FlashcardViewController: UIPageViewController {
    
//  MARK: Variable
    
    var maindata : Flashcard!
    
//  MARK: View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self
        if let startViewController = self.viewControllerAtIndex(index: 0){
            setViewControllers([startViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
        
}

//  MARK: PageviewDelegate

extension FlashcardViewController: UIPageViewControllerDataSource {
    
    func viewControllerAtIndex(index: Int) -> CardViewController?
    {
        if index == NSNotFound {
            return nil
        }
        if let cardViewController = storyboard?.instantiateViewController(identifier: ViewControllerIdent.flashcardViewController) as? CardViewController {
            cardViewController.maindata = self.maindata
            cardViewController.wordContent = maindata.words[index].content
            cardViewController.wordNoteContent = maindata.words[index].note
            cardViewController.index = index
            cardViewController.remembered = maindata.words[index].remember
            return cardViewController
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! CardViewController).index
        if index>0 {
            index = index - 1
        }else {
            index = maindata.words.count-1
        }
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! CardViewController).index
        if index<maindata.words.count - 1
        {
            index = index + 1
        } else
        {
            index = 0
        }
        return self.viewControllerAtIndex(index: index)
    }
    
}
