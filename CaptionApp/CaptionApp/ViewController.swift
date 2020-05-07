//
//  ViewController.swift
//  CaptionApp
//
//  Created by Rebecca  Slatkin on 1/27/20.
//  Copyright © 2020 Syracuse University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var captions : [Caption] = []
    var pictures : [Picture] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //captionLabel.text = "He is scared! :("
        generatesCaptions()
        generatesPictures()
        populateCaption()
        populateImage()
    }

    //create a bunch of pictures and captions
    func generatesCaptions(){
        captions = [Caption(text: "Hello"),
                    Caption(text: "How's it going"),
                    Caption(text: "dkslada"),
                    Caption(text: "abcdef"),
                    Caption(text: "qwerty"),
                    Caption(text: "is class over yet")]
                    //let caption = Caption(text: "Random Caption")
    }

     func generatesPictures(){
        pictures = [Picture(imageName: "BearHiding"),
                    Picture(imageName: "Fish"),
                    Picture(imageName: "LaughingSeal"),
                    Picture(imageName: "Otters")]
    }
    
    func populateCaption(){
        let caption = captions.randomElement()
        captionLabel.text = caption?.text
    }
    
    func populateImage(){
        let picture = pictures.randomElement()
        imageView.image =   UIImage(named: picture?.imageName ?? "")
    }
}

