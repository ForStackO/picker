//
//  UIColorMore.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/19.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit



extension UIColor {
    
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    
    
    convenience init(rgb: Int, alpha: CGFloat = 1) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
        )
    }
    
    
    
    
}


extension UIColor{


    static let main = UIColor(rgb: 0xFF2D55)
    static let textHeavy = UIColor(rgb: 0x333333)    
    static let textLightGray = UIColor(rgb: 0x999999)
    
    static let instrumentsTag = UIColor(rgb: 0xFF7584)
    static let shadowScore = UIColor(rgb: 0xCDCDCD, alpha: 0.5)
    static let scoreSwitch = UIColor(rgb: 0x725A7C)
    
    
    static let academicSelected = UIColor(rgb: 0xC66C86)    
}





