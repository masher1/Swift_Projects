//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Malkiel Asher on 4/9/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {

    
    var meals: [Meal] = [
        Meal(name: "Breakfast", foods: [Food(name: "Pacakes", description: "Buttermilk pancakes topped with Maple Syrup, fresh-cut bananas, and whipped cream"),
        Food(name: "Bacon, Egg and Cheese Sandwich", description: "Savory seasoned sausage, fluffy eggs, and creamy American cheese are layered carefully between one of our warm buttermilk biscuits"),
        Food(name: "French Toast Sticks", description: "Sweet, golden brown, and piping hot, our five-piece French Toast Sticks are perfect for dipping in a side of sweet syrup while you’re on the go")]),
        
        Meal(name: "Lunch", foods: [Food(name: "Cheeseburger", description: "Thick, juicy half-pound burger grilled to order with lettuce, onion, tomato, pickles, your choice of cheese, Applewood smoked bacon and housemade burger sauce on a toasted potato bun."),
        Food(name: "Classic Smash", description: "Served with lettuce, tomato, onion & pickles. 100% Certified Angus Beef & Black Bean burgers include American cheese, Smash Sauce & ketchup on a classic bun."),
        Food(name: "Sonoma Caesar Salad", description: "Asiago, Parmesan, Romano, sundried tomatoes, and stretch bread croutons.")]),
        
        Meal(name: "Dinner", foods: [Food(name: "Chicken Parmigiana", description: "A perfectly seasoned breast of tender chicken with melted cheese and Pomodoro Sauce. Served with spaghetti and Marinara Sauce."),
        Food(name: "Chicken and Rice Falafel Meatballs", description: "Roasted chicken and jasmine rice, white bean puree, green tahini, lemon-herb salad, and grilled flatbread."),
        Food(name: "Pasta's Poblano Burger", description: "Autumn's harvest farms' beef, roasted poblano, thick-cut bacon, NY sharp cheddar, arugula, hot tom aioli, brioche bun, and served with french fries or side salad.")])]
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
<<<<<<< HEAD
        
=======
  
>>>>>>> d11ad83d0936b39b9a47310eb82958f8c56a9ea4
        cell.textLabel?.text = meals[indexPath.section].foods[indexPath.row].name
        cell.detailTextLabel?.text = meals[indexPath.section].foods[indexPath.row].description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
