//
//  NewContentDetailsViewController.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/6/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//
/*
File Description: This file is responsible for creating/editing the new submissions.
Allow the user to change the data and save the new content by pressing the saveButton
*/


import UIKit

class NewContentDetailsViewController: UIViewController, UITextViewDelegate {


    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var submission:Submission?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    func textViewDidChange(_ textView: UITextView){
        updateSaveButtonState()
    }
    
    
    func updateSaveButtonState(){
        let title = titleTextField.text ?? ""
        let content = contentTextView.text ?? ""

        saveButton.isEnabled = !title.isEmpty && !content.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        if let submission = submission {
            titleTextField.text = submission.title
            contentTextView.text = submission.content
        }
        updateSaveButtonState()
    }
    
// MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {return}
        
        let title = titleTextField.text ?? ""
        let content = contentTextView.text ?? ""
        //add time here
        //add SubmissionType here

        submission = Submission(title: title, content: content)
    }
    
}
