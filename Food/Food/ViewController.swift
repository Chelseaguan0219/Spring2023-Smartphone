//
//  ViewController.swift
//  Food
//
//  Created by chelsea on 2/21/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageNames = ["image0", "image1","image2", "image3","image4","image5"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.imgContainer.image = UIImage(named: imageNames[indexPath.row])
        cell.lblimage.text = imageNames[indexPath.row]
        return cell
    }

}

