//
//  VIP_centerRequest.swift
//  musicSheet
//
//  Created by Jz D on 2019/10/22.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit



extension VIP_centerCtrl{
    
    
    func checkVIP(){
   
        
        
        
        do{
            if let path = Bundle.main.url(forResource: "one", withExtension: "plist"){
                let data = try Data(contentsOf: path)
                let decoder = PropertyListDecoder()
                let info = try decoder.decode(GeneralSingle<VIP_centerModel>.self, from: data)
                self.data = info.data
                let vCenter = self.follow as! UITableView
                vCenter.reloadData()
            }
        }
        catch let error as NSError{
            print(error)
        }



    }
    
    
}


