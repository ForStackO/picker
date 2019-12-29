//
//  SidePanView.swift
//  musicSheet
//
//  Created by Jz D on 2019/9/11.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit



class SidePanView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(SidePanView.push(_:)))
        addGestureRecognizer(pan)
        backgroundColor = UIColor.white
        isUserInteractionEnabled = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("SidePanView")
    }
    
    
    @objc func push(_ gesture: UIPanGestureRecognizer){
        if gesture.state == UIGestureRecognizer.State.began{
            let velocity = gesture.velocity(in: gesture.view)
            if velocity.x>0{
                 panSth()
            }
        }
    }
    
    @objc func panSth(){
        
        
        
        
    }
}
