//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Malkiel Asher on 4/20/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        buttonMaker(kk: kk);
        buttonMaker(kk: kk2);
        buttonMaker(kk: kk3);
        buttonMaker(kk: kk4);
        
    }

    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.google.com"){
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
        
    }
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
                
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in
                print("User Selected Camera Action")
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in
                print("User Selected Photo Library Action")
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            print("Can Not Send Mail")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["masher@syr.edu"])
        mailComposer.setSubject("Look at this!")
        mailComposer.setMessageBody("Hello, this is an email from the app I made!", isHTML: false)
        
        //Extra: Attach an image attachment to the email address!
        let imageData: NSData = imageView.image!.pngData()! as NSData
        mailComposer.addAttachmentData(imageData as Data, mimeType: "", fileName: "GooglePic.png")
        self.present(mailComposer, animated: true, completion: nil)
        
        present(mailComposer, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    func buttonMaker(kk: UIButton){
        kk.backgroundColor = UIColor.clear
        kk.layer.cornerRadius = 5
        kk.layer.borderWidth = 2
        kk.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBOutlet weak var kk: UIButton!
    @IBOutlet weak var kk2: UIButton!
    @IBOutlet weak var kk3: UIButton!
    @IBOutlet weak var kk4: UIButton!
}

