//
//  SelectRoomTypeTableViewController.swift
//  HotelManzana
//
//  Created by Malkiel Asher on 4/27/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

protocol SelectRoomTypeTableViewControllerDelegate:class {
    func didSelect(roomType: RoomType)
}
class SelectRoomTypeTableViewController: UITableViewController {
    weak var delegate:
    SelectRoomTypeTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RoomType.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)
        
        let roomType =  RoomType.all[indexPath.row]
        
        cell.textLabel?.text = roomType.name
        cell.detailTextLabel?.text = "$ \(roomType.price)"
        
        if roomType == self.roomType {
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    var roomType: RoomType?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        roomType = RoomType.all[indexPath.row]
        delegate?.didSelect(roomType: roomType!)
        tableView.reloadData()
    }

}
