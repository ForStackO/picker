//
//  VIP_records.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/27.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit





class VIP_records: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let title = UILabel()
        title.text = "会员记录"
        title.font = UIFont.regular(ofSize: 16)
        title.textColor = UIColor.textLightGray
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            title.widthAnchor.constraint(equalToConstant: 65),
            title.heightAnchor.constraint(equalToConstant: 16)
        ])
        
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("没有写")
    }

}
