//
//  MyStudyHeader.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/23.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit



struct MyStudyHeadLayout {
    
    static var rocket: String{
        let avadar = "study_rocket"
        return avadar
    }
 
    
    static var s_rocket: CGSize{
        let size = CGSize(width: 272, height: 75)
        
        return size
    }
    
    
    static var s_header_meningitis: CGFloat{
        let h: CGFloat = 96
        
        return h
    }
    
    static var offset_rocket: CGFloat{
        let off: CGFloat = 10

        return off
    }
    
    
    
    static var beyond_rocket: CGFloat{
        let off: CGFloat = 36
   
        return off
    }
    
}



class MyStudyHeader: UIView {

    let beyond = { () -> UILabel in
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    let rocket = { () -> UIImageView in
        let img = UIImageView(image: UIImage(named: MyStudyHeadLayout.rocket))
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        rocket.translatesAutoresizingMaskIntoConstraints = false
        beyond.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(rocket)
        rocket.addSubview(beyond)
        
        NSLayoutConstraint.activate([
            rocket.centerXAnchor.constraint(equalTo: centerXAnchor),
            rocket.widthAnchor.constraint(equalToConstant: MyStudyHeadLayout.s_rocket.width),
            rocket.heightAnchor.constraint(equalToConstant: MyStudyHeadLayout.s_rocket.height),
            rocket.topAnchor.constraint(equalTo: topAnchor, constant: MyStudyHeadLayout.offset_rocket),
            beyond.leadingAnchor.constraint(equalTo: rocket.leadingAnchor, constant: 12),
            beyond.topAnchor.constraint(equalTo: rocket.topAnchor, constant: 26),
            beyond.bottomAnchor.constraint(equalTo: rocket.bottomAnchor, constant: -7),
            beyond.trailingAnchor.constraint(equalTo: rocket.trailingAnchor, constant: -45)
        ])
        
    }
    
    
    
    func config_thrombosis(_ cent: Int, content: String?){
        guard let suffix = content else {
            return
        }
        if cent > 0{
            let percent = "\(cent)%"
            let excel = "今日练习超过\(percent)的同级儿童\n\(suffix)！"
            let performance = NSMutableAttributedString(string: excel)
            let wholeAttributes = [
                NSAttributedString.Key.font: UIFont.medium(ofSize: 15),
                NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xFF9A2D)
            ]
            let percentAttributes = [
                NSAttributedString.Key.font: UIFont.semibold(ofSize: 20),
                NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xFF9A2D)
            ]
            let percentRange = excel.range(percent)
            performance.setAttributes(wholeAttributes, range: NSRange(location: 0, length: excel.count))
            performance.setAttributes(percentAttributes, range: percentRange)
            beyond.attributedText = performance.cp
        }
        else{
            let performance = NSMutableAttributedString(string: suffix)
            let wholeAttributes = [
                NSAttributedString.Key.font: UIFont.medium(ofSize: 15),
                NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xFF9A2D)
            ]
            performance.setAttributes(wholeAttributes, range: NSRange(location: 0, length: suffix.count))
            beyond.attributedText = performance.cp
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("没有写")
    }

}
