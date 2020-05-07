//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Malkiel Asher on 4/28/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    
    var todo: ToDo?
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        if sender == subjectTextField {
            subjectTextField.resignFirstResponder()
            titleTextField.becomeFirstResponder()
        }
        else{
            titleTextField.resignFirstResponder()
            if(isPickerHidden == true){
                isPickerHidden = !isPickerHidden
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    func updateSaveButtonState(){
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    var isPickerHidden = true
    let dateLabelIndexPath = IndexPath(row: 0, section: 2)
    let datePickerIndexPath = IndexPath(row: 1, section: 2)
    let notesTextViewIndexPath = IndexPath(row: 0, section: 3)
    
    let normalCellHeight: CGFloat = 44
    let largeCellHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo {
            navigationItem.title = "To-Do"
            subjectTextField.text = todo.subject
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isComplete
            dueDatePickerView.date = todo.dueDate
            notesTextView.text = todo.notes
        } else{
            dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
        }
        
        updateDueDateLabel(date: dueDatePickerView.date)
        updateSaveButtonState()
    }
    
    func updateDueDateLabel(date: Date){
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePickerView.date)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return isPickerHidden ? 0 : 200
        case notesTextViewIndexPath:
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dateLabelIndexPath {
            isPickerHidden = !isPickerHidden
            dueDateLabel.textColor = isPickerHidden ? .black :
            tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
        
    guard segue.identifier == "saveUnwind" else { return }
        
        let subject = subjectTextField.text!
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePickerView.date
        let notes = notesTextView.text
        
        todo = ToDo(subject: subject, title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }

   

}
