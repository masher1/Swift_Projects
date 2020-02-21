//
//  ViewController.swift
//  BasicsOfSwift
//
//  Created by Malkiel Asher on 1/18/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let foo = 3; // constant
        var err = 3; // variable
        err = 4; //this is valid
        //foo = 2; // cannot do this as it is a constant
        
        if (foo == 3){
            err+=1;
            cloudSee.animationDuration = 5;
        }
    }

    @IBOutlet weak var cloudSee: UIImageView!
    
}

