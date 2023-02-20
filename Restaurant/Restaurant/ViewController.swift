//
//  ViewController.swift
//  RestaurantApp
//
//  Created by chelsea on 2/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblViewTop: UITableView!
    @IBOutlet weak var tblViewBottom: UITableView!
    
    var selectedFood: [String] = []
    
    let restaurants = ["Ascend", "The George", "Paju"]
    let food = [["Steak", "Magic Mushroom", "Hamachi Truffle Roll"],
                ["Octopus", "Baked Alaska", "Scallops"],
                ["Panna Cotta", "Chicken Wings", "Quail Eggs"]]
  
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewTop {
            return restaurants.count
        }
        else{
            return selectedFood.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblViewTop{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellRest", for: indexPath)
            cell.textLabel?.text = restaurants[indexPath.row]
            return cell
            
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellFood" , for: indexPath)
            cell.textLabel?.text = selectedFood[indexPath.row]
            return cell
        }
        
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblViewTop {
            selectedFood = food[indexPath.row]
            print(selectedFood)
            tblViewBottom.reloadData()

        }
            

        }
        
}

