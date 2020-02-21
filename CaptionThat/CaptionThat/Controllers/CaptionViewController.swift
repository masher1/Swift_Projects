//
//  CaptionViewController.swift
//  CaptionThat
//
//  Created by Malkiel Asher on 2/14/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class CaptionViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var userImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    /// Calls the `LandingToCaptionedSegue` with the Picture as an argument
    func initalizeCaptionView(with picture: Picture) {
        /// make sure identifier matches the value you set in  Main.Storyboard
        self.performSegue(withIdentifier: "LandingToCaptionViewSegue", sender: nil)
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
