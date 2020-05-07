//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Malkiel Asher on 4/27/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    var registration: Registration?{
        guard let roomType = roomType else { return nil }
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = WifiSwitch.isOn
        
        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hasWifi)
    }
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet var numberOfAdultsLabel: UILabel!
    @IBOutlet var numberOfAdultsStepper: UIStepper!
    @IBOutlet var numberOfChildrenLabel: UILabel!
    @IBOutlet var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet var WifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: Any) {
    }
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 1, section: 2)
   
    let checkInDateLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelIndexPath = IndexPath(row: 0, section: 2)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    var roomType: RoomType?
    func didSelect(roomType: RoomType){
        self.roomType = roomType
        updateRoomType()
    }
    func updateRoomType() {
        if let roomType = roomType{ roomTypeLabel.text = roomType.name } else { roomTypeLabel.text = "" }
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
//        let firstName = firstNameTextField.text ?? ""
//        let lastName = lastNameTextField.text ?? ""
//        let email = emailTextField.text ?? ""
//        let checkInDate = checkInDatePicker.date
//        let checkOutDate = checkOutDatePicker.date
//        let numberOfAdults = Int(numberOfAdultsStepper.value)
//        let numberOfChildren = Int(numberOfChildrenStepper.value)
//        let hasWifi = WifiSwitch.isOn
//        let roomChoice = roomType?.name ?? "Not Set"
//        
//        print("DONE TAPPED")
//        print("firstName: \(firstName)")
//        print("lastName: \(lastName)")
//        print("email: \(email)")
//        print("checkIn: \(checkInDate)")
//        print("checkOut: \(checkOutDate)")
//        print("numberOfAdults: \(numberOfAdults)")
//        print("numberOfChildren: \(numberOfChildren)")
//        print("hasSwitch: \(hasWifi)")
//        print("roomType: \(roomChoice)")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }

    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    func updateDateViews(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
        
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            if isCheckInDatePickerShown {
                return 216.0
            }
            else{
                return 0.0
            }
        case checkOutDatePickerCellIndexPath:
            if isCheckOutDatePickerShown {
                return 216.0
            }
            else{
                return 0.0
            }
        default:
            return 44.0
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case checkInDateLabelIndexPath:
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            }else if isCheckOutDatePickerShown{
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }
            else{
                isCheckInDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()

        case checkOutDateLabelIndexPath:
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            }else if isCheckInDatePickerShown{
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            }
            else{
                isCheckOutDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType"{
            let destinationViewController = segue.destination as? SelectRoomTypeTableViewController
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
    }
}
