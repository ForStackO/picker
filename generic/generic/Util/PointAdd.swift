//
//  PointAdd.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/21.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit



extension CGPoint{
    
    func advance(_ offsetX: CGFloat = 0, y offsetY: CGFloat = 0) -> CGPoint{
        
        
        return CGPoint(x: x+offsetX, y: y+offsetY)
    }
    
    
}


extension CGRect{
    
    mutating func advance(_ orig: CGPoint, x offsetX: CGFloat = 0, y offsetY: CGFloat = 0){
        
        origin = orig.advance(offsetX, y: offsetY)
        
    }
    
    
}
