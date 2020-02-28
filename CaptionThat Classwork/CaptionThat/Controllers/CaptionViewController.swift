//
//  CaptionViewController.swift
//  CaptionThat
//
//  Created by Malkiel Asher on 2/14/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class CaptionViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate {
    //MARK: Properties
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var captionValueLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
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
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage

        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }

    
    /// Mark: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        captionValueLabel.text = "Default Text"
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        captionTextField.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
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

