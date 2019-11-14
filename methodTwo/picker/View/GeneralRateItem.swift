//
//  GeneralRateItem.swift
//  musicSheet
//
//  Created by Jz D on 2019/10/8.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit

class GeneralRateItem: UIView {

    let createLabel = { name in
        let lbl = UILabel()
        lbl.textColor = UIColor.gray
        lbl.text = name
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.backgroundColor = UIColor.white
        lbl.textAlignment = .center
        return lbl
    } as (String) -> UILabel
    
    var lhs: UILabel!
    var mid: UILabel!
    var rhs: UILabel!
    
    
    init(_ left: String, _ middle: String, _ right: String){
        super.init(frame: CGRect.zero)
        lhs = createLabel(left)
        lhs.translatesAutoresizingMaskIntoConstraints = false
        mid = createLabel(middle)
        mid.translatesAutoresizingMaskIntoConstraints = false
        rhs = createLabel(right)
        rhs.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lhs)
        addSubview(mid)
        addSubview(rhs)
        
        NSLayoutConstraint.activate(
            [lhs.leadingAnchor.constraint(equalTo: leadingAnchor),
            lhs.centerYAnchor.constraint(equalTo: centerYAnchor),
            lhs.widthAnchor.constraint(equalToConstant: 55),
            lhs.heightAnchor.constraint(equalToConstant: 18)
        ])
        
       
        let mid_offset: CGFloat = 11
        
        NSLayoutConstraint.activate(
            [mid.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            mid.centerYAnchor.constraint(equalTo: centerYAnchor),
            mid.widthAnchor.constraint(equalToConstant:  83 + mid_offset * 2),
            mid.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate(
            [rhs.trailingAnchor.constraint(equalTo: trailingAnchor),
            rhs.centerYAnchor.constraint(equalTo: centerYAnchor),
            rhs.widthAnchor.constraint(equalToConstant: 23 + mid_offset),
            rhs.heightAnchor.constraint(equalToConstant: 18)
        ])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func selected(){
        // 选中状态
        lhs.textColor = UIColor.magenta
        mid.textColor = UIColor.magenta
        rhs.textColor = UIColor.magenta
    }
    
    
    func unselected(){
        // 一般状态
        lhs.textColor = UIColor.gray
        mid.textColor = UIColor.gray
        rhs.textColor = UIColor.gray
    }

}
