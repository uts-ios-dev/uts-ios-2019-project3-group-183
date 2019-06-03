//
//  BrowseListCell.swift
//  Cryptopia
//
//  Created by Mr_Jesson on 2019/5/30.
//  Copyright © 2019 UTS_iOSDev. All rights reserved.
//

import UIKit
import SwiftyJSON

class BrowseListCell: UITableViewCell {

    @IBOutlet weak var sortLab: UILabel!
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var detailNameLab: UILabel!
    @IBOutlet weak var priceLab: UILabel!
    @IBOutlet weak var changeLab: UILabel!
    @IBOutlet weak var capLab: UILabel!
    @IBOutlet weak var volLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configWithData(data:JSON) -> Void {
        self.sortLab.text = data["rank"].string
        self.nameLab.text = data["symbol"].string
        self.detailNameLab.text = data["name"].string
        let price:String = data["priceUsd"].string ?? "0.00"
        let priceFloat = Float(price)
        self.priceLab.text = Utils.decimalMoney(money: priceFloat ?? 0.00)

        let change:String = data["changePercent24Hr"].string!
        let changeFloat = Float(change)!
        let str = String(format: "%.2f", changeFloat)
        if changeFloat >= 0.00 {
            self.changeLab.textColor = UIColor.green
            self.changeLab.text = "+"+str+"%"
        }else{
            self.changeLab.textColor = UIColor.red
            self.changeLab.text = str+"%"
        }
        let cap:String = data["marketCapUsd"].string!
        let capFloat = Float(cap)
        self.capLab.text = Utils.decimalMoneyWithUnit(money: capFloat ?? 0.00)

        let vol:String = data["volumeUsd24Hr"].string!
        let volFloat = Float(vol)
        self.volLab.text = Utils.decimalMoneyWithUnit(money: volFloat ?? 0.00)
    }

}
