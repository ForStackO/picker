//
//  VIP_tips.swift
//  musicSheet
//
//  Created by Jz D on 2019/10/26.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit

class VIP_tipsFoot: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let title = UILabel()
        title.text = "*仅含有示范音频的曲目才收费哦"
        title.textAlignment = .right
        title.font = UIFont.regular(ofSize: 12)
        title.textColor = UIColor.textLightGray
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        
        backgroundColor = UIColor(rgb: 0xF3F3F3)
        layer.debug()
 
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("没有写")
    }

}
