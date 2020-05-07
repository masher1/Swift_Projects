//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Malkiel Asher on 4/28/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController, ToDoCellDelegate {
    func checkmarkTapped(sender: ToDoCellTableViewCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var todo = todos[indexPath.row]
            todo.isComplete = !todo.isComplete
            todos[indexPath.row] = todo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos)
        }
    }
    
    var todos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        if let savedToDos = ToDo.loadToDos(){
            todos = savedToDos
        }
        else {
            todos = ToDo.loadSampleToDos()
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier") as? ToDoCellTableViewCell else {
            fatalError("Could not deque a cell")
        }
        
        cell.delegate = self
        
        let todo = todos[indexPath.row]
        cell.titleLabel?.text = todo.title
        cell.isCompleteButton.isSelected = todo.isComplete
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            ToDo.saveToDos(todos)
        }
    }
      
    // MARK: - Navigation

    @IBAction func unwindToToDoList(segue: UIStoryboardSegue){
        guard segue.identifier == "saveUnwind" else { return }
        let  sourceViewController = segue.source as! ToDoDetailTableViewController
        
        if let todo = sourceViewController.todo {
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                todos[selectedIndexPath.row] = todo
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }else{
                let newIndexPath = IndexPath(row: todos.count, section: 0)
                todos.append(todo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        ToDo.saveToDos(todos)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditToDo"{
        let navController = segue.destination as! ToDoDetailTableViewController
        //let todoDetailTableViewController = navController.topViewController as? ToDoDetailTableViewController{
        let indexPath = tableView.indexPathForSelectedRow!
        let selectedToDo = todos[indexPath.row]
        navController.todo = selectedToDo
        }
    }
}
