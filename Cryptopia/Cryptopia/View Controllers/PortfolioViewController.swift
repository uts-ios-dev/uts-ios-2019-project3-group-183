//
//  ViewController.swift
//  Cryptopia
//
//  Created by SuperUser on 19/5/19.
//  Copyright © 2019 UTS_iOSDev. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let name = ["Bitcoin", "Litecoin"]
    let price = ["0.18 BTC", "0.1 LTC"]
    let priceGrowth = [111, 123]
    let worthinAUD = [1111, 14124]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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
        let bitcoin = tableView.dequeueReusableCell(withIdentifier: "Bitcoin", for: indexPath)
        let nameCell: UILabel = bitcoin.viewWithTag(1) as! UILabel
        let priceCell: UILabel = bitcoin.viewWithTag(2) as! UILabel
        let priceGrowthCell: UILabel = bitcoin.viewWithTag(3) as! UILabel
        let worthinAUDCell: UILabel = bitcoin.viewWithTag(4) as! UILabel
        
        nameCell.text = name[indexPath.item]
        priceCell.text = price[indexPath.item]
        priceGrowthCell.text = "$AU\(priceGrowth[indexPath.item])"
        worthinAUDCell.text = "$AU \(worthinAUD[indexPath.item])"
        
        return bitcoin
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cryptocurrency Portfolio"
    }
}

