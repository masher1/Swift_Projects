//
//  PlacesViewController.swift
//  AboutMe
//
//  Created by Malkiel Asher on 3/29/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController {

   override func viewDidLoad()
    {
        super.viewDidLoad()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        libya_imageView.isUserInteractionEnabled = true
        libya_imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    @IBOutlet weak var libya_imageView: UIImageView!
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        // Your action
        
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
