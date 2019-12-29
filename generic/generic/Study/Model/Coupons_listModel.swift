//
//  Coupons_listModel.swift
//  musicSheet
//
//  Created by Jz D on 2019/10/22.
//  Copyright © 2019 Jz D. All rights reserved.
//

import Foundation


struct Coupons_list: Decodable {
    
    let expire: [CouponPiece]
    let not_used: [CouponPiece]
    let used: [CouponPiece]
}





struct CouponPiece: Decodable {
    
    let end_time: String
    let id: Int
    let is_expire: Int
    
    let is_used: Int
    let reduce: Int
    let start_time: String



}
