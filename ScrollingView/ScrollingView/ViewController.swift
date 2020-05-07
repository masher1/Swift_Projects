//
//  ViewController.swift
//  ScrollingView
//
//  Created by Malkiel Asher on 4/6/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        // Do any additional setup after loading the view.
    }
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWasShown(_ notification: NSNotification){
        guard let info = notification.userInfo, let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {return}
    
    let keyboardFrame = keyboardFrameValue.cgRectValue
    let keyboardSize = keyboardFrame.size
    
    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
    
    ScrollController.contentInset = contentInsets
    ScrollController.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification){
        let contentInsets = UIEdgeInsets.zero
        ScrollController.contentInset = contentInsets
        ScrollController.scrollIndicatorInsets = contentInsets
    }
    
    @IBOutlet weak var ScrollController: UIScrollView!
    

}

