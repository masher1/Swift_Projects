//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Malkiel Asher on 4/15/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {

    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    var emoji:Emoji?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func textEditingChanged(_ sender: UITextField){
        updateSaveButtonState()
    }
    
    func updateSaveButtonState(){
        let symbolText = symbolTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
        }
        
        updateSaveButtonState()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {return}
        
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
    

}
