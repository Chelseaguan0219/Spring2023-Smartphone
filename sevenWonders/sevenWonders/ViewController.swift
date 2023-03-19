//
//  ViewController.swift
//  sevenWonders
//
//  Created by chelsea on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageNames = ["Taj Mahal","Great Wall of China", "Chichen Itza","Petra", "Machu Picchu","Christ the Redeemer","Colosseum"]
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.imageContainer.image = UIImage(named: "\(indexPath.row)")
        cell.lblImage.text = "\(imageNames[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index =  indexPath.row
        performSegue(withIdentifier: "segueDetail", sender: "self")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.recieved = index
    }
    
    
    


}
