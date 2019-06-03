//
//  Utils.swift
//  Cryptopia
//
//  Created by Mr_Jesson on 2019/5/30.
//  Copyright © 2019 UTS_iOSDev. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    //金钱格式化
    static func decimalMoney(money:Float)-> String {
        //初始化NumberFormatter@
        let format = NumberFormatter()
        //设置numberStyle（有多种格式）
        format.numberStyle = .currency
        //转换后的string
        let str:String = format.string(from: NSNumber(value: money)) ?? ""
        return str
    }
    
    //金钱格式化
    static func decimalMoneyWithUnit(money:Float)-> String {
        var tempMoney = money;
        if money > 1000000.00 {
            tempMoney = money/1000000.00
        }
        
        //初始化NumberFormatter@U
        let format = NumberFormatter()
        //设置numberStyle（有多种格式）
        format.numberStyle = .currency
        //转换后的string
        let str:String = format.string(from: NSNumber(value: tempMoney)) ?? ""
        
        return str+"B"
    }
    

}
