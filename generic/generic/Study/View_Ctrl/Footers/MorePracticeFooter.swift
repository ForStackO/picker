//
//  MorePracticeCell.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/23.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit



protocol MorePracticeFooterDelegate: class {
    func showMorePractice(_ state: Bool, section: Int)
}




class MorePracticeFooter: UIView {
    
    
      enum Info{
           static let unfold = "展开更多"
           static let fold = "收起"
      }
    
      var section = -1
      var state: Bool = false{
            didSet{
                if state{
                    spanMore.text = Info.fold
                }
                else{
                    spanMore.text = Info.unfold
                }
            }
      }
    
    
      weak var delegate: MorePracticeFooterDelegate?
    
    
      lazy var spanMore: UILabel = {
            let lbl = UILabel()
            lbl.text = Info.unfold
            lbl.textAlignment = .center
            lbl.textColor = UIColor(rgb: 0xFF7584)
            lbl.font = UIFont.regular(ofSize: 12)
            lbl.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer()
            lbl.addGestureRecognizer(tap)
            tap.addTarget(self, action: #selector(spanMoreTap))
         
            return lbl
      }()
    
       override init(frame: CGRect) {
            super.init(frame: frame)
  
            backgroundColor = UIColor(rgb: 0xF8F8F8)
            spanMore.translatesAutoresizingMaskIntoConstraints = false
            addSubview(spanMore)
    
            NSLayoutConstraint.activate([
                spanMore.leadingAnchor.constraint(equalTo: leadingAnchor),
                spanMore.trailingAnchor.constraint(equalTo: trailingAnchor),
                spanMore.topAnchor.constraint(equalTo: topAnchor),
                spanMore.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
       }
       
        
       
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("MorePracticeFooter")
       }
   
    
        @objc
        func spanMoreTap(){
            self.delegate?.showMorePractice(self.state, section: self.section)
        }
    
    
        override func draw(_ rect: CGRect) {
            guard let context = UIGraphicsGetCurrentContext() else { return  }
            let origin = rect.origin
            let padding: CGFloat = 8
            
            let path = UIBezierPath(roundedRect: CGRect(origin: origin.advance(padding), size: CGSize(width: rect.size.width - padding * 2, height: rect.size.height - 3)), byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 5, height: 5))
            path.lineWidth = 1
            let shadow = UIColor.shadowScore
            context.setShadow(offset: CGSize(width: 1, height: 1), blur: 4, color: shadow.cgColor)
            // 中间的白色
            UIColor.white.setFill()
            path.fill()
        }
}



// 我没有使用 collectionView  的装饰视图，我使用了视图的拼装
