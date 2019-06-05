//
//  Utils.swift
//  Cryptopia
//
//  Created by Mr_Jesson on 2019/5/30.
//  Copyright © 2019 UTS_iOSDev. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    //initialize the money
    static func decimalMoney(money:Float)-> String {
        //initialize NumberFormatter@
        let format = NumberFormatter()
        //set numberStyle（there have a lot of style）
        format.numberStyle = .currency
        //transfer string
        let str:String = format.string(from: NSNumber(value: money)) ?? ""
        return str
    }
    
    //money initialization 
    static func decimalMoneyWithUnit(money:Float)-> String {
        var tempMoney = money;
        if money > 1000000.00 {
            tempMoney = money/1000000.00
        }
        
        //initialize NumberFormatter@U
        let format = NumberFormatter()
        //set numberStyle
        format.numberStyle = .currency
        //tansfer string
        let str:String = format.string(from: NSNumber(value: tempMoney)) ?? ""
        
        return str+"B"
    }
    

}
