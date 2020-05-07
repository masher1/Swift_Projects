//
//  ViewController.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/4/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NewContentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonMaker(button: NewContentButton);
        // Do any additional setup after loading the view.
    }


    
    func buttonMaker(button: UIButton){
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.backgroundColor = UIColor.systemTeal
    }
    
}

