//
//  ViewController.swift
//  Cryptopia
//
//  Created by SuperUser on 19/5/19.
//  Copyright © 2019 UTS_iOSDev. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name = ["Bitcoin", "Litecoin"]
    var price = ["0.18 BTC", "0.1 LTC"]
    var priceGrowth = [111, 123]
    var worthinAUD = [1111, 14124]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
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
        currencyPriceLabel.text = price[indexPath.item]
        if (priceGrowth[indexPath.item] > 0) {
            priceGrowthLabel.text = "▲ $AU\(priceGrowth[indexPath.item])"
            priceGrowthLabel.textColor = UIColor.init(red:0.01, green:0.81, blue:0.00, alpha:1.0)
        } else if (priceGrowth[indexPath.item] < 0) {
            priceGrowthLabel.text = "▼ $AU\(priceGrowth[indexPath.item])"
             priceGrowthLabel.textColor = UIColor.init(red:0.76, green:0.23, blue:0.13, alpha:1.0)
        }
        
        worthinAUDLabel.text = "$AU \(worthinAUD[indexPath.item])"
        
        return crypto
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Owned currencies"
    }
}
