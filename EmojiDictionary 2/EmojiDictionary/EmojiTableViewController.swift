//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Malkiel Asher on 4/8/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "👮🏼‍♂️", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk; chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion"),
        Emoji(symbol: "🥺", name: "Pleading Face", description: "A face with furrowed eyebrows, a small frown, and large, \"puppy dog\" eyes.", usage: "Adoration; feeling touched"),
        Emoji(symbol: "❤️", name: "Red Heart", description: "A classic love heart emoji.", usage: "expression of love"),
        Emoji(symbol: "😂", name: "Face with Tears of Joy", description: "A face with a big grin, uplifting eyebrows, and smiling eyes, each shedding a tear from laughing so hard", usage: "funny; pleasing"),
        Emoji(symbol: "🥰", name: "Smiling Face with Hearts", description: "A face with smiling eyes, a closed smile, rosy cheaks, and several hearts floating around its head.", usage: "affectionate feelings; being in love"),
        Emoji(symbol: "😊", name: "Smiling Face with Smiling Eyes", description: "A face with smiling eyes and a broad, closed smile turning up to rosy cheeks.", usage: "genuine happiness and warm; positive feelings"),
        Emoji(symbol: "🔥", name: "Fire", description: "A flame as produced when something is on fire.", usage: "fire; hot; lit"),
        Emoji(symbol: "👍", name: "Thumbs Up", description: "Thumbs up sign.", usage: "approval; like"),
        Emoji(symbol: "🦠", name: "Microbe", description: "A squiggly, single-celled microorganism with prominent cilia.", usage: "bacteria; virus; germs; disease")]
    

    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        
        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //Another altermative to the code above
        //navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return emojis.count
        }
        else{
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell

        // Configure the cell...
        let emoji = emojis[indexPath.row]
        
        cell.update(with: emoji)
        
        //cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        //cell.detailTextLabel?.text = emoji.description

        cell.showsReorderControl = true //enables drag to reorder option
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        let emoji = emojis[indexPath.row]
//        print("\(emoji.symbol) \(indexPath)")
//    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath){
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
        return .delete
       }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditEmojiTableViewController = navController.topViewController as! AddEditEmojiTableViewController
            
            addEditEmojiTableViewController.emoji = emoji
        }
        
    }
    
    @IBAction func unwindToEmojiTableView(unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "saveUnwind", let sourceViewController = unwindSegue.source as? AddEditEmojiTableViewController, let emoji = sourceViewController.emoji else {return}
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        }
        else{
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}
