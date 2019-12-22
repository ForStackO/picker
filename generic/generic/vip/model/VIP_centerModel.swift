//
//  VIP_centerModel.swift
//  musicSheet
//
//  Created by Jz D on 2019/11/9.
//  Copyright © 2019 Jz D. All rights reserved.
//

import Foundation




struct GeneralSingle<T>: Decodable  where T: Decodable {
    let code: Int
    var data: T
    var state: Int

}



struct VIP_centerModel: Decodable{
    let price_lis: [PriceInfo]
    let record: [BuyRecord]
    let vip_expiration_time: String
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
