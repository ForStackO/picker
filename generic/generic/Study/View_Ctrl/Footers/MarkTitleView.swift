//
//  TitleCell.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/23.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit


protocol MarkTitleCellDelegate: class {
    func mark_MainSideContainerCtrl_close()
   
    func back_ankle()
}





class MarkTitleView: UIView{
    
    
    
    var draw_deng = false{
        didSet{
            if draw_deng{
                setNeedsDisplay()
            }
        }
    }
    
    var title: UILabel = {
        let lbl = UILabel()
        lbl.text = "今日练习"
        lbl.backgroundColor = UIColor.white
        lbl.textColor = UIColor(rgb: 0x333333)
        lbl.font = UIFont.myStudyTitle
        return lbl
    }()
    
    
    
    lazy var mark: UILabel = {
        let lbl = UILabel()
        lbl.text = "打卡"
        lbl.backgroundColor = UIColor(rgb: 0x725A7C)
        lbl.font = UIFont.medium(ofSize: 14)
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.isUserInteractionEnabled = true
        lbl.corner(16)
        
        return lbl
    }()
    
    
    var progress: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(rgb: 0x725A7C)
        lbl.font = UIFont.regular(ofSize: 13)
        return lbl
    }()
    
    
    weak var delegate: MarkTitleCellDelegate?
    
    
    let markWidth: CGFloat = 58 - 5
    let leading: CGFloat = 8
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          backgroundColor = UIColor.white
          
          let edge: CGFloat = 30
          
    
          activeMark()
          title.translatesAutoresizingMaskIntoConstraints = false
          mark.translatesAutoresizingMaskIntoConstraints = false
          progress.translatesAutoresizingMaskIntoConstraints = false
          addSubs([title, mark, progress])
          let offset = CGFloat(3)
          NSLayoutConstraint.activate([
                title.widthAnchor.constraint(equalToConstant: 96),
                title.heightAnchor.constraint(equalToConstant: 31),
                title.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                mark.widthAnchor.constraint(equalToConstant: markWidth),
                mark.heightAnchor.constraint(equalToConstant: edge),
                mark.trailingAnchor.constraint(equalTo: trailingAnchor),
                mark.bottomAnchor.constraint(equalTo: bottomAnchor),
                progress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18-offset),
                progress.bottomAnchor.constraint(equalTo: bottomAnchor),
                progress.heightAnchor.constraint(equalToConstant: edge),
                progress.trailingAnchor.constraint(equalTo: mark.trailingAnchor, constant: offset-markWidth)
          ])
      
     }
     
      
     
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("MorePracticeFooter")
     }



    
    func config_pneumonia(contrast nights: Int?){
        guard let days = nights else{
            return
        }
        progress.text = "您已坚持\(days)天，连续打卡领取更多优惠"
        progress.isHidden = false
        mark.isHidden = false
    }

    
    func empty(){
        mark.isHidden = true
        progress.isHidden = true
        draw_deng = true
    }
    
    
    override func draw(_ rect: CGRect) {
        UIColor.main.setFill()
        
        // 左边的红色矩形，red bar, 红条
        UIRectFill(CGRect(x: 0, y: MyStudyData.shared.fill_y_header, width: MyStudyData.shared.fill_width_header, height: MyStudyData.shared.fill_height_header))
        if draw_deng == false {
            let edge: CGFloat = 30
            let path = UIBezierPath()
            let x_padding = markWidth - edge/2
            let end = rect.end.advance(-x_padding)
            path.move(to: end)
            let last = rect.leftBottom.advance(leading + edge/2)
            path.addLine(to: last)
            path.addArc(withCenter: last.advance(y: -edge/2), radius: edge/2, startAngle: CGFloat.pi * 0.5, endAngle: CGFloat.pi * 1.5, clockwise: true)
            path.addLine(to: end.advance(y: -edge))
            path.close()
            UIColor(rgb: 0xF0EEF1).setFill()
            path.fill()
        }
    }
    
}



extension MarkTitleView{
    func disableMark(){
        mark.isUserInteractionEnabled = false
        mark.backgroundColor = UIColor(rgb: 0xC7BDCB)
        mark.text = "已打卡"
    }
    
    
    func tbdMark(){
        mark.isUserInteractionEnabled = true
        mark.backgroundColor = UIColor(rgb: 0xC7BDCB)
        mark.text = "打卡"
    }
    
    
    func activeMark(){
        mark.text = "打卡"
        mark.backgroundColor = UIColor(rgb: 0x725A7C)
        mark.textColor = UIColor.white
        mark.isUserInteractionEnabled = true
    }
}
