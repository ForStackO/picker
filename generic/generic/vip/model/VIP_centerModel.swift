//
//  VIP_centerModel.swift
//  musicSheet
//
//  Created by Jz D on 2019/11/9.
//  Copyright © 2019 Jz D. All rights reserved.
//

import Foundation



struct VIP_centerModel: Decodable{
    let price_lis: [PriceInfo]
    let record: [BuyRecord]
    let vip_expiration_time: String
}

extension VIP_centerModel{

 
    
}

struct PriceInfo: Decodable{
    let id: Int
    let name: String
    let price: Int
}



struct BuyRecord: Decodable{
    let content: String
    let create_time: String
}
