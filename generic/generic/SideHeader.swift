//
//  SideHeader.swift
//  musicSheet
//
//  Created by Jz D on 2019/12/19.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit



protocol SideHeaderDelegate: class {
    
    var h: SideHeader{ get set }
    var view: UIView! {get}
    var follow: UIView {get}

    func back()
}

extension SideHeaderDelegate{
    
    func doLayout(_ offset: CGFloat = 0){
        view.addSubview(h)
        view.addSubview(follow)
        let top: CGFloat = 40
        h.translatesAutoresizingMaskIntoConstraints = false
        follow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            h.topAnchor.constraint(equalTo: view.topAnchor),
            h.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            h.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            h.heightAnchor.constraint(equalToConstant: top)
        ])
        
        NSLayoutConstraint.activate([
            follow.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            follow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            follow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            follow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: offset)
        ])
       
    }
    
}



class SideHeader: UIView {
    
    
    weak var delegate: SideHeaderDelegate?
    
    let title: String
    let avatar: String
    
    lazy var headline = { () -> UILabel in
        let lbl = UILabel()
        lbl.font = UIFont.accountListTitle
        lbl.textColor = UIColor.textHeavy
        lbl.textAlignment = .center
        
        lbl.text = title
        return lbl
    }()
    
    lazy var arrow = { () -> UIImageView in
        let img = UIImageView()
        img.image = UIImage(named: avatar)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    let line: UIView = {
        let string = UIView()
        string.backgroundColor = UIColor(rgb: 0xD8D8D8)
        return string
    }()
    
    init(title name: String, icon: String = "mine_fork") {
        title = name
        avatar = icon
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.white
        headline.translatesAutoresizingMaskIntoConstraints = false
        arrow.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(headline)
        addSubview(arrow)
        addSubview(line)
        
        NSLayoutConstraint.activate([
            headline.centerXAnchor.constraint(equalTo: centerXAnchor),
            headline.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            arrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            arrow.widthAnchor.constraint(equalToConstant: 26),
            arrow.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        
        NSLayoutConstraint.activate([
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
            line.leadingAnchor.constraint(equalTo: leadingAnchor),
            line.trailingAnchor.constraint(equalTo: trailingAnchor),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        layer.debug()
        actions()
    }
    
    
    
    override init(frame: CGRect) {
         fatalError("没实现  2  ")
    }
    
    
    func actions(){
        let tap = UITapGestureRecognizer()
        arrow.addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(SideHeader.pop))
        
     
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("没实现")
    }
 
    
    func change(title name: String){
        headline.text = name
    }
    
    @objc
    func pop(){
        delegate?.back()
    }
}
