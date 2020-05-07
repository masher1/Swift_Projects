//
//  LandingViewController.swift
//  CaptionThatApp
//
//  Created by Rebecca  Slatkin on 2/9/20.
//  Copyright © 2020 Syracuse University. All rights reserved.
//

import Foundation
import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    /// Sets up the view with my email address
    func setupView() {
        self.authorLabel.text = "RSlatki@Syr.edu"
    }
    
    @IBAction func handleUserDidTapImageGallery(_ sender: UIButton) {
      	
    }
    
    /// Calls the `LandingToCaptionedSegue` with the Picture as an argument
    func initalizeCaptionView(with picture: Picture) {
        /// make sure withIdentifier: matches the value you set in  Main.Storyboard
        self.performSegue(withIdentifier: "LandingToCaptionedSegue", sender: nil)
    }
}


extension LandingViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func showImagePicker() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image"]
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = false
        pickerController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Run everything in defer **last**
        defer { picker.dismiss(animated: true, completion: nil) }
        
        // Retrieve the image I selected
        guard let image = (info[.originalImage] ?? info[.editedImage]) as? UIImage else {
            assertionFailure("Failed to retrieve image after image picker told us an image was picked")
                   return
               }
        // Create a Picture instance
        

    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Do nothing. We have nothing to handle here. Dismiss the picker
        picker.dismiss(animated: true, completion: nil)
    }
}
