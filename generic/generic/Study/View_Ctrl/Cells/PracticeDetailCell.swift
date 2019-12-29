//
//  PracticeDetailCell.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/23.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit

enum PracticeDetailPosition{
    case begin, middle, end
}

struct ScoreItemLayout {
    static let corn: CGFloat = 4
    static let cornerTrailing: CGFloat = 1
    static let shadowOffset: CGFloat = 2
}



class PracticeDetailCell: UITableViewCell {
    
    
    var start = false{
        didSet{
            setNeedsDisplay()
        }
    }
    
    
    @IBOutlet weak var index: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var register: UILabel!
    
    func config(_ num: Int, title: String, times: Int, duration: Int, start isStarting: Bool){
        if num < 10{
            index.font = UIFont.regular(ofSize: 14)
        }
        else{
            index.font = UIFont.regular(ofSize: 10)
        }
        index.text = "\(num)"
        name.text = title
        name.font = UIFont.myStudyListScoreName
        
        start = isStarting
        
        
        let raw = "共练习 \(times) 次 / \(duration) 分钟"
        let hardWork = NSMutableAttributedString(string: raw)
        let wholeAttributes = [
            NSAttributedString.Key.font: UIFont.regular(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x333333)
        ]
        let partAttributes = [
            NSAttributedString.Key.font: UIFont.regular(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x518FC3)
        ]
        let practiceTimes = raw.range("\(times)")
        let practiceDuration = raw.rangeTagged("\(duration) 分")
        hardWork.setAttributes(wholeAttributes, range: NSRange(location: 0, length: raw.count))
        hardWork.setAttributes(partAttributes, range: practiceTimes)
        hardWork.setAttributes(partAttributes, range: practiceDuration)
        register.attributedText = hardWork.cp
    }
    
    
    
    
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return  }
        
        let origin = rect.origin
        let leftBottom = CGPoint(x: rect.minX, y: rect.maxY)
        let rightUp = CGPoint(x: rect.maxX, y: rect.minY)
        let end = CGPoint(x: rect.maxX, y: rect.maxY)
        let path = UIBezierPath()
        path.lineWidth = 1
        
        let padding: CGFloat = 8
        path.move(to: leftBottom.advance(padding))
        path.addLine(to: origin.advance(padding))
        path.addLine(to: rightUp.advance(-padding))
        path.addLine(to: end.advance(-padding))
        path.close()
        context.saveGState()
        
        let shadow = UIColor.shadowScore
        context.setShadow(offset: CGSize(width: ScoreItemLayout.cornerTrailing, height: 0), blur: 4, color: shadow.cgColor)
        // 中间的白色
        UIColor.white.setFill()
        path.fill()
        context.restoreGState()
        
        
        // 下面那个圆
        
        
            let offset: CGFloat = 6
            context.addEllipse(in: CGRect(x: (rect.minX + 18 - offset * 0.5), y: (rect.minY + 16 - offset * 0.5), width: (12 + offset ), height: (12 + offset )))
            context.setFillColor(UIColor.scoreSwitch.cgColor)
            context.fillPath()
        
        
        UIColor(rgb: 0xEDEDED).setFill()
        // 下面那条线
        let lhs: CGFloat = 16
        UIRectFill(CGRect(x: lhs, y: rect.maxY - 1, width: rect.width - lhs * 2, height: 1))
        // 触发了 reuse , 复用
        if start{
            // 放在最后画
            UIRectFill(CGRect(x: 8, y: 0, width: rect.width - 8 * 2, height: 1))
        }
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor(rgb: 0xF8F8F8)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
