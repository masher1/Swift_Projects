//
//  HistoryTableViewController.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/5/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//
/*
File Description: This file is responsible for holding the Table View of previosly saved content to the app. For example, if I have saved a submission before and want to look at it later, I will be able to find it here. I can also add, edit, and delete the submissions from/to the tableView.
 To delete an item, simply swipe from left to right and you will then be able to delete it
 To add an item, click on the plus button in the top right corner and you will be able to add a new submission
 To edit an item, click on the cell you would like to edit and first you will be greeted with the full view and then once you are on that screen you will be able to edit the content of the screen by pressing the Edit button.
*/

import UIKit

class HistoryTableViewController: UITableViewController {

    var submissions: [Submission] = [
    Submission(title: "Reddit Post", content: "The greatest tragedy of Charlie and the Chocolate factory isn't the mishaps involving children, but how a master of theoretical physics chose to make candy for a living."),
    Submission(title: "Writing Prompt", content: "The year is 1910. Adolf Hitler, a struggling artist, has fought off dozens of assasination attemps by well meaning time travelers, but this one is different. This traveller doesn't want to kill Hitler, he wants to teach him to paint. He pulls off his hood to reveal the frizzy afro of Bob Ross.")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        if !Submission.loadFromFile().isEmpty {
            submissions = Submission.loadFromFile()
        }
        else{
            submissions = Submission.loadSampleSubmissions()
        }
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
    
//    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
//        let tableViewEditingMode = tableView.isEditing
//
//        tableView.setEditing(!tableViewEditingMode, animated: true)
//    }

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
           Submission.saveToFile(submissions: submissions)
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
            Submission.saveToFile(submissions: submissions)
        } else if editingStyle == .insert {
            
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        if !tableView.isEditing {
//            self.performSegue(withIdentifier: "editContent", sender: self)
//        }
//        else{
//            self.performSegue(withIdentifier: "unshakeableView", sender: self)
//        }
//    }
    
    // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
        
           if segue.identifier == "unshakeableView" {
               let indexPath = tableView.indexPathForSelectedRow!
               let submission = submissions[indexPath.row]
               let navController = segue.destination as! UINavigationController
               let viewController = navController.topViewController as! PresenterViewController
               
            viewController.submissions = submission
           }
       }
    
    @IBAction func unwindToHistoryTableView(unwindSegue: UIStoryboardSegue) {
           guard unwindSegue.identifier == "saveUnwindAdd", let sourceViewController = unwindSegue.source as? NewContentDetailsViewController, let submission = sourceViewController.submission else {return}
           
           if let selectedIndexPath = tableView.indexPathForSelectedRow{
               submissions[selectedIndexPath.row] = submission
               tableView.reloadRows(at: [selectedIndexPath], with: .none)
           }
           else{
               let newIndexPath = IndexPath(row: submissions.count, section: 0)
               submissions.append(submission)
               tableView.insertRows(at: [newIndexPath], with: .automatic)
           }
        Submission.saveToFile(submissions: submissions)
       }
}
