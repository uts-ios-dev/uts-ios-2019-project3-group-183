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
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        name.append("Test")
        price.append("1234")
        priceGrowth.append(1112)
        worthinAUD.append(121313)
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
        priceGrowthCell.text = "$AU\(priceGrowth[indexPath.item])"
        worthinAUDCell.text = "$AU \(worthinAUD[indexPath.item])"
        
        return crypto
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cryptocurrency Portfolio"
    }
}

