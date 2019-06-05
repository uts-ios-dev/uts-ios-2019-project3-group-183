//
//  ViewController.swift
//  Cryptopia
//
//  Created by SuperUser on 19/5/19.
//  Copyright © 2019 UTS_iOSDev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PortfolioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let name = ["Bitcoin", "Litecoin", "Ethereum"]
    var price: [Float] = [0.18, 0.10, 0.50]
    let currencyAcronym = ["BTC", "LTC", "ETH"]
    var priceGrowth: [Double] = [0.00, 0.00, 0.00]
    var worthinAUD: [Double] = [0.00, 0.00, 0.00]
    var dataArray1:JSON?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Welcome, \(UserDefaults.standard.string(forKey: "Username") ?? "User")"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        Alamofire.request("https://api.coincap.io/v2/assets").responseJSON {
            (responseData) -> Void in
            //Updates currency
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let jsonObj:JSON = swiftyJsonVar["data"];
                self.dataArray1 = jsonObj
                
                for index in 0...self.name.count-1 {
                    
                    var dataIndex: Int = 0
        
                    for i in 0...self.dataArray1!.count-1 {
                        let indexedString = self.dataArray1![i]["name"].string
                        
                        if indexedString == self.name[index] {
                                dataIndex = i
                            //If indexed string is the same as the current currency name index, changes the value of dataIndex to the index of the indexedString.
                        }
                    }
                    
                    let data:JSON = self.dataArray1![dataIndex];
                    
                    let usdPrice = data["priceUsd"].string ?? "0.00"
                    let USDPriceFloat = Float(usdPrice) //Converts the string to a float
                    let worthInUSD = self.price[index] * USDPriceFloat!
                    
                    let change:String = data["changePercent24Hr"].string!
                    let changeFloat = Float(change)!
                    
                    let AUDWorth = Double(round(100*Double(worthInUSD) * 1.43)/100) //Converts to AUD
                    self.worthinAUD[index] = AUDWorth
                    
                    let priceGrowthInAUD =  Double(round(100*Double(self.worthinAUD[index] * Double(changeFloat)))/100)
                    self.priceGrowth[index] = priceGrowthInAUD
                    }
                }
                self.tableView.reloadData()
            }
        }
    
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "Login")
        UserDefaults.standard.removeObject(forKey: "Username")
    }
    
    
    //-MARK TABLE VIEW RELATED FUNCTIONS-//
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crypto = tableView.dequeueReusableCell(withIdentifier: "CryptocurrencyCell", for: indexPath)
        
        let currencyNameLabel: UILabel = crypto.viewWithTag(1) as! UILabel
        let currencyPriceLabel: UILabel = crypto.viewWithTag(2) as! UILabel
        let priceGrowthLabel: UILabel = crypto.viewWithTag(3) as! UILabel
        let worthinAUDLabel: UILabel = crypto.viewWithTag(4) as! UILabel
        
        currencyNameLabel.text = name[indexPath.item]
        currencyPriceLabel.text = "\(price[indexPath.item]) \(currencyAcronym[indexPath.item])"
        if (priceGrowth[indexPath.item] > 0) {
            priceGrowthLabel.text = "▲ $AU\(priceGrowth[indexPath.item])"
            priceGrowthLabel.textColor = UIColor.init(red:0.01, green:0.81, blue:0.00, alpha:1.0)
        } else if (priceGrowth[indexPath.item] < 0) {
            priceGrowthLabel.text = "▼ $AU \(priceGrowth[indexPath.item])"
            priceGrowthLabel.textColor = UIColor.init(red:0.76, green:0.23, blue:0.13, alpha:1.0)
        }
        
        worthinAUDLabel.text = "$AU \(worthinAUD[indexPath.item])"
        return crypto
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Owned currencies"
    }
}
