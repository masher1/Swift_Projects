//
//  PresenterViewController.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/6/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//
/*
File Description: This file was created to manage the PresenterView which is the view that will contain the non-editable (directly at least) version of the submission that the user wanted to view in Shakeless form.
 The CoreMotion will communicate directly with this file to move the contentTextView object accordingly to the opposite direction that the phone is moving.
*/

import UIKit

class PresenterViewController: UIViewController {

        @IBOutlet weak var titleTextField: UITextField!
        @IBOutlet weak var contentTextView: UITextView!
        
        var submissions:Submission?

        override func viewDidLoad() {
            super.viewDidLoad()
            //        buttonMaker(button: NewContentButton);
            if let submissions = submissions {
                titleTextField.text = submissions.title
                contentTextView.text = submissions.content
            }
            //Implement the motion for the contentTextView here
        }
        
        //    func buttonMaker(button: UIButton){
        //        button.layer.cornerRadius = 25
        //        button.layer.borderWidth = 1
        //        button.layer.borderColor = UIColor.systemBlue.cgColor
        //        button.backgroundColor = UIColor.systemTeal
        //    }
    

    @IBAction func unwindToPresenterView(unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "saveUnwindEdit", let sourceViewController = unwindSegue.source as? NewContentDetailsViewController, let submission = sourceViewController.submission else {return}
        
        Submission.saveToFile(submissions: [submission])
    }

}
