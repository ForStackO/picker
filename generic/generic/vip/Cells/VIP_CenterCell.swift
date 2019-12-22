//
//  VIP_CenterCell.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/26.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit


protocol VIP_CenterCellProtocol: class {
    func allPay(_ index: Int)
}


class VIP_CenterCell: UITableViewCell {
    
    
    @IBOutlet weak var lhs: UILabel!
    @IBOutlet weak var rhs: UILabel!
    @IBOutlet weak var purchase: UIButton!
    
    weak var delegate: VIP_CenterCellProtocol?
    var choosenIndex: Int = 0
    
    func configMiddle(_ right: Int,_ left: String, _ price: Int){
        purchase.isHidden = false
        rhs.isHidden = true
        choosenIndex = right
        lhs.text = left
        lhs.font = UIFont.regular(ofSize: 18)
        lhs.textColor = UIColor(rgb: 0x515151)
        purchase.setTitle("\(price)元", for: UIControl.State.normal)
    }
    
    
    
    func configTail(_ left: String, right: String){
        purchase.isHidden = true
        lhs.text = left
        lhs.textColor = UIColor.textLightGray
        lhs.font = UIFont.regular(ofSize: 15)
    
        rhs.text = right
        rhs.isHidden = false
        rhs.textColor = UIColor(rgb: 0x999999)
        rhs.font = UIFont.regular(ofSize: 15)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
  
        purchase.corner(13)
        rhs.textColor = UIColor.textLightGray
        rhs.contentMode = .right
        
        rhs.numberOfLines = 1
        actions()
    }
    
    
    func actions(){
        
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
