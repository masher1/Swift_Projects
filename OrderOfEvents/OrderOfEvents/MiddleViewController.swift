//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Malkiel Asher on 4/5/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - View Did Load")
        if let existingText = EventLabel.text {
            EventLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController - View Will Appear")
        if let existingText = EventLabel.text {
            EventLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewWillAppear"
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController - View Will Disappear")
        if let existingText = EventLabel.text {
            EventLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewWillDisappear"
            eventNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController - View Did Appear")
        if let existingText = EventLabel.text {
            EventLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewDidAppear"
            eventNumber += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController - View Did Disappear")
        if let existingText = EventLabel.text {
            EventLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewDidDisappear"
            eventNumber += 1
        }
    }
    
    @IBOutlet weak var EventLabel: UILabel!
    var eventNumber:Int = 1
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
