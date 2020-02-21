//
//  CaptionViewController.swift
//  CaptionThat
//
//  Created by Malkiel Asher on 2/14/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class CaptionViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var captionValueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        captionTextField.delegate = self
    }
    
    
    /// Calls the `LandingToCaptionedSegue` with the Picture as an argument
    func initalizeCaptionView(with picture: Picture) {
        /// make sure identifier matches the value you set in  Main.Storyboard
        self.performSegue(withIdentifier: "LandingToCaptionViewSegue", sender: nil)
    }
    /// MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        captionValueLabel.text = textField.text
    }
    
    /// Mark: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        captionValueLabel.text = "Default Text"
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

