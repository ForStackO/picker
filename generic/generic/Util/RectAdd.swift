//
//  RectAdd.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/26.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit


extension CGRect{
    
    var end: CGPoint{
        return CGPoint(x: maxX, y: maxY)
    }
    
    var leftBottom: CGPoint{
        return CGPoint(x: minX, y: maxY)
    }
    
    var rightUp: CGPoint{
        return CGPoint(x: maxX, y: minY)
    }
}



struct UI {
    static var height: CGFloat{
        return UIScreen.main.bounds.height
    }
    
    
    static var layout: CGRect{
        return UIScreen.main.bounds
    }
    
    
    static var width: CGFloat{
        return UIScreen.main.bounds.width
    }
    

    static var iPhoneScale: CGFloat{
        return (UIScreen.main.bounds.width / 1024)
    }
}






