//
//  I_have_not_learningFooter.swift
//  musicSheet
//
//  Created by Jz D on 2019/11/19.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit

class I_have_not_learningFooter: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let lbl = UILabel()
        lbl.text = "无练习记录"
        lbl.font = UIFont.regular(ofSize: 18)
        lbl.textColor = UIColor(rgb: 0x999999)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lbl)
   
        NSLayoutConstraint.activate([
            lbl.centerXAnchor.constraint(equalTo: centerXAnchor),
            lbl.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        ])
        
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("MorePracticeFooter")
    }
}
