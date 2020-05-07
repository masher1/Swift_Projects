//
//  HistoryTableViewController.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/5/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    var submissions: [Content] = [
    Content(title: "Reddit Post", content: "The greatest tragedy of Charlie and the Chocolate factory isn't the mishaps involving children, but how a master of theoretical physics chose to make candy for a living."),
    Content(title: "Writing Prompt", content: "The year is 1910. Adolf Hitler, a struggling artist, has fought off dozens of assasination attemps by well meaning time travelers, but this one is different. This traveller doesn't want to kill Hitler, he wants to teach him to paint. He pulls off his hood to reveal the frizzy afro of Bob Ross.")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return submissions.count
        }
        else{
            return 0
        }
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCells", for: indexPath) as! HistoryTableViewCell

        // Configure the cell...
        let submission = submissions[indexPath.row]
        
        cell.update(with: submission)

        cell.showsReorderControl = true //enables drag to reorder option
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath){
           let movedSubmission = submissions.remove(at: fromIndexPath.row)
           submissions.insert(movedSubmission, at: to.row)
           tableView.reloadData()
       }
       
       override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
           return .delete
          }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            submissions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
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
