//
//  ViewController.swift
//  FinancialModel
//
//  Created by chelsea on 3/18/23.
//

import UIKit
import Alamofire
import SwiftSpinner
import SwiftyJSON

class ViewController: UIViewController {

    
    @IBOutlet weak var txtTyping: UITextField!
    @IBOutlet weak var lblStockPrice: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
   
    @IBOutlet weak var lblWeb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getInformation(_ sender: Any) {
        guard let symbol = txtTyping.text else {return}
        let url = "\(baseURL)/\(symbol)?apikey=\(apiKey)"
        SwiftSpinner.show("Getting information for \(symbol)")
        AF.request(url).responseJSON{response in
             SwiftSpinner.hide()
             if response.error != nil{
                  print("Error in response")
                  return
             }
             guard let rawData = response.data else {return}
             guard let jsonArray = JSON(rawData).array else {return}
             guard let company = jsonArray.first else{return}
             
             let companyName = company["companyName"].stringValue
             let price = company["price"].doubleValue
             let website = company["website"].stringValue
            
             self.lblStockPrice.text = "CompanyName = \(companyName)"
             self.lblPrice.text = "Price = \(price)"
             self.lblWeb.text = "Website = \(website)"
            
        }
        
    }
}
