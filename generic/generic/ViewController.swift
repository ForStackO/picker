//
//  ViewController.swift
//  generic
//
//  Created by Jz D on 2019/12/22.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let vip = VIPCenterCtrl()
    let feed = Feedbacks()
    let study = MyStudyListCtrl()

    override func viewDidLoad() {
        super.viewDidLoad()
        config(on: [vip, feed, study])
    }

    
    
    @IBAction func one(_ sender: UIButton) {
        view.bringSubviewToFront(vip.view)
    }
    
    
    
    @IBAction func two(_ sender: UIButton) {
        view.bringSubviewToFront(feed.view)
    }
    
    
    
    @IBAction func three(_ sender: UIButton) {
        view.bringSubviewToFront(study.view)
    }
    
    
    
    func config(on ctrls: [UIViewController]){
        ctrls.forEach { (a_ctrl) in
            addChild(a_ctrl)
            a_ctrl.view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(a_ctrl.view)
            NSLayoutConstraint.activate([
                a_ctrl.view.topAnchor.constraint(equalTo: view.topAnchor),
                a_ctrl.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                a_ctrl.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                a_ctrl.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (UIScreen.main.bounds.size.width - 60) * 0.5 + 6)
            ])
      
        }
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

