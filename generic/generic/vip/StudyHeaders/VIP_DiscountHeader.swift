//
//  VIP_DiscountHeader.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/27.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit


enum VIP_option{
    case mine
    case score
}


class VIP_DiscountHeader: UIView {

    private lazy var discount = { () -> UIButton in
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "vip_condition_bg"), for: UIControl.State.normal)
        btn.adjustsImageWhenHighlighted = false
        btn.titleLabel?.textAlignment = .center
        if case .score = type{
            btn.titleLabel?.font = UIFont.regular(ofSize: 15)
            btn.setTitle("开启VIP解锁所有曲目", for: UIControl.State.normal)
        }
        else{
            btn.titleLabel?.font = UIFont.regular(ofSize: 13)
            btn.setTitle(expire, for: UIControl.State.normal)
        }
        btn.setTitleColor(UIColor(rgb: 0x744E0F), for: UIControl.State.normal)
        return btn
    }()
    
    
    var expire: String = "2019-11-11"{
        didSet{
            discount.setTitle(expire, for: UIControl.State.normal)
        }
    }
    
    var type = VIP_option.score
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        discount.translatesAutoresizingMaskIntoConstraints = false
        addSubview(discount)
        NSLayoutConstraint.activate([
            discount.centerXAnchor.constraint(equalTo: centerXAnchor),
            discount.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            discount.widthAnchor.constraint(equalToConstant: 290),
            discount.heightAnchor.constraint(equalToConstant: 31)
        ])

        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("没有写")
    }
    

}
