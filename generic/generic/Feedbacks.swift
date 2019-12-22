//
//  Feedbacks.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/27.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit



protocol FeedbackDelegate: class{
    func giveFeedback(_ text: String)
}


struct Feeds_mandible{
    static let lhs = "感谢您使用好多曲谱，使用过程中有任何意见或建议"
    static let rhs = "请反馈给我们。"
}

enum Resolution_occipitofrontalis{
    case big, small
    
    static var device: Resolution_occipitofrontalis{
        if UI.width >= 1024{
            return .big
        }
        else{
            // iPad ( 第 6 代 )
            return .small
        }
    }
}




class Feedbacks: UIViewController, SideHeaderDelegate {
    
    var tips: String{
        switch Resolution_occipitofrontalis.device{
         case .big:
            return "\(Feeds_mandible.lhs)\(Feeds_mandible.rhs)"
         case .small:
            return "\(Feeds_mandible.lhs)\n\(Feeds_mandible.rhs)"
        }
    }
        
    var firstTap = true
    
    
    lazy var feed: UIButton = {
        let btn = UIButton()
        btn.setTitle("提交", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.backgroundColor = UIColor.main
        btn.titleLabel?.font = UIFont.regular(ofSize: 16)
        btn.corner(16)
  
        return btn
    }()
    
    
    weak var delegate: FeedbackDelegate?
    let writes = UITextView()
    

    internal var follow: UIView = { () -> UIView in
        let v = UIView()
        v.backgroundColor = UIColor(rgb: 0xF3F3F3)
        return v
    }()
    
    lazy var h = { () -> SideHeader in
        let head = SideHeader(title: "意见反馈")
        head.delegate = self
        return head
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.yellow.cgColor
        doLayout()
        
        
        //
        
        writes.delegate = self
        writes.textColor = UIColor.textLightGray
        writes.font = UIFont.regular(ofSize: 16)
        writes.text = tips
        follow.addSubview(writes)
        follow.addSubview(feed)
        writes.translatesAutoresizingMaskIntoConstraints = false
        feed.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            writes.bottomAnchor.constraint(equalTo: follow.bottomAnchor, constant: -50),
            writes.leadingAnchor.constraint(equalTo: follow.leadingAnchor, constant: 20),
            writes.trailingAnchor.constraint(equalTo: follow.trailingAnchor, constant: -20),
            writes.topAnchor.constraint(equalTo: follow.topAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            feed.bottomAnchor.constraint(equalTo: follow.bottomAnchor, constant: -10),
            feed.leadingAnchor.constraint(equalTo: follow.leadingAnchor, constant: 20),
            feed.trailingAnchor.constraint(equalTo: follow.trailingAnchor, constant: -20),
            feed.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        
    }
    

    
    func reset(){
        writes.text = tips
        firstTap = true
    }
    
    
    func back() {
        view.endEditing(true)
    }
}



extension Feedbacks: UITextViewDelegate{
    
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if firstTap{
            firstTap = false
            textView.text = nil
        }
        return true
    }
    
    
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == nil || textView.text.count == 0{
            textView.text = tips
            firstTap = true
        }
    }
    

    
}
