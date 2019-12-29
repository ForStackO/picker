//
//  TitleCell.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/23.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit


class TitlePracticeView: UIView {
    
    let downOffset: CGFloat = 48
    
    var progress: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = UIColor.academicSelected
        lbl.font = UIFont.regular(ofSize: 13)
        return lbl
    }()
    
    
    var title: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = UIColor.white
        lbl.textColor = UIColor(rgb: 0x333333)
        lbl.font = UIFont.myStudyTitle
        return lbl
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        title.translatesAutoresizingMaskIntoConstraints = false
        progress.translatesAutoresizingMaskIntoConstraints = false
        addSubs([title, progress])
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            title.widthAnchor.constraint(equalToConstant: 96),
            title.heightAnchor.constraint(equalToConstant: 31),
            progress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            progress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            progress.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            progress.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        

    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("没有写")
    }

    func empty(_ name: String){
        title.text = name
        progress.isHidden = true
    }
    
    
    
    func config(_ name: String, per: Int, tip: String?){
        title.text = name
        progress.isHidden = false
        var achive = "当日练习超过\(per)%的同级儿童"
        if let judge = tip{
            achive += ",\(judge)"
        }
        progress.text = achive
        
    }
    
    
    func config(_ name: String){
        
        title.text = name
        progress.isHidden = true
        
        
    }
    
    
    
 
    
    override func draw(_ rect: CGRect) {
        UIColor.main.setFill()

        UIRectFill(CGRect(x: 0, y: MyStudyData.shared.fill_y_header, width: MyStudyData.shared.fill_width_header, height: MyStudyData.shared.fill_height_header))
    }
    
}
