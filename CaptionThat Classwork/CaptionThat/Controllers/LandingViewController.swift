//
//  LandingViewController.swift
//  CaptionThat
//
//  Created by Malkiel Asher on 2/14/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           self.authorLabel.text = "masher@syr.edu"
           // Do any additional setup after loading the view.
       }
    
    @IBAction func handleUserDidTapImageGallery(_ sender: UIButton) {
        showImagePicker();
        
    }
    func initalizeCaptionView(with picture: Picture) {
        /// make sure withIdentifier: matches the value you set in  Main.Storyboard
        self.performSegue(withIdentifier: "LandingToCaptionViewSegue", sender: nil)
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
        let picture = Picture(image: image)
        initalizeCaptionView(with: picture)
    }
	
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Do nothing. We have nothing to handle here. Dismiss the picker
        picker.dismiss(animated: true, completion: nil)
    }
}
