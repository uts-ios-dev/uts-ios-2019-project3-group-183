//
//  BrowseViewController.swift
//  Cryptopia
//
//  Created by SuperUser on 19/5/19.
//  Copyright © 2019 UTS_iOSDev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BrowseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name: [String] = []
    var price: [String] = []
    var priceGrowth: [String] = []
    var worthinAUD: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        
        Alamofire.request("https://api.coincap.io/v2/assets").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let responseData = swiftyJsonVar["data"].arrayObject {
                    self.arrRes = responseData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tableView.reloadData()
                }
                
                for i in 1...50 {
                    self.name.append(self.arrRes[i]["name"] as! String)
                    self.price.append("")
                    self.priceGrowth.append(self.arrRes[i]["changePercent24Hr"] as! String)
                    self.worthinAUD.append(self.arrRes[i]["priceUsd"] as! String)
                    self.tableView.reloadData()
                    print(self.name)
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crypto = tableView.dequeueReusableCell(withIdentifier: "Bitcoin", for: indexPath)
        let nameCell: UILabel = crypto.viewWithTag(1) as! UILabel
        let priceCell: UILabel = crypto.viewWithTag(2) as! UILabel
        let priceGrowthCell: UILabel = crypto.viewWithTag(3) as! UILabel
        let worthinAUDCell: UILabel = crypto.viewWithTag(4) as! UILabel
        
        nameCell.text = name[indexPath.item]
        priceCell.text = price[indexPath.item]
        priceGrowthCell.text = "$\(worthinAUD[indexPath.item])"
        worthinAUDCell.text = "$\(priceGrowth[indexPath.item])"
        
        return crypto
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Browse Cryptocurrencies"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
