//
//  CircleCell.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/23.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit
@IBDesignable
class CircleCell: UITableViewCell {
    
    
    
    @IBOutlet weak var kinds: UILabel!
    @IBOutlet weak var practices: UILabel!
    @IBOutlet weak var lasts: UILabel!
    
    
    
    
    @IBOutlet weak var gravidarum: UILabel!
    
    
    
    
    var fill = UIColor.instrumentsTag{
        didSet{
            setNeedsDisplay()
        }
    }
    
    
    func config(_ kindsNum: Int, practicesNum: Int, lastsNum: Int, position: PracticeDetailPosition){
        kinds.text = "\(kindsNum)"
        practices.text = "\(practicesNum)"
        lasts.text = "\(lastsNum)"
        var syndrome = "时长(分钟)"
        switch position {
        case .begin:
            fill = UIColor.instrumentsTag
        case .end:
            syndrome = "天数"
            fill = UIColor(rgb: 0xB3D0E8)
        default:
            fill = UIColor(rgb: 0xB3D0E8)
        }
        gravidarum.text = syndrome
    }
    
     
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext(){
            let edge: CGFloat = 56
            // let y = rect.origin.y + 24
            let y = rect.maxY - (111 - 16)
            let spacing: CGFloat = 26
            let leftOffset: CGFloat = edge/2 + spacing + edge
            let rightOffset: CGFloat = edge/2 + spacing
            context.addEllipse(in: CGRect(x: rect.midX - leftOffset, y: y, width: edge, height: edge))
            context.addEllipse(in: CGRect(x: rect.midX - edge/2, y: y, width: edge, height: edge))
            context.addEllipse(in: CGRect(x: rect.midX + rightOffset, y: y, width: edge, height: edge))
            context.setFillColor(fill.cgColor)
            context.fillPath()
        }
    }
    
}



/*
 
 绘制，又不是发生在 content  View 上，
 
 
 content  View 上面涂了颜色， 就把绘制遮住了
 content  View 上面刷了背景色， background
 
 
 
 
 
 */
