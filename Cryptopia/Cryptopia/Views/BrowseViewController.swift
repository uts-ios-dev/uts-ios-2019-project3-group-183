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

class BrowseViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var dataArray1:JSON?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        Alamofire.request("https://api.coincap.io/v2/assets").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let jsonObj:JSON = swiftyJsonVar["data"];
                self.dataArray1 = jsonObj
                self.mainTableView.reloadData()
            }
        }
    }
    

}

extension BrowseViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BrowseListCell = tableView.dequeueReusableCell(withIdentifier: "BrowseListCell") as! BrowseListCell
        
        let data:JSON = self.dataArray1![indexPath.row];
        cell.configWithData(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray1?.count ?? 0;
    }
    
    
}
