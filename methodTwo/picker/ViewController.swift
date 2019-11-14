//
//  ViewController.swift
//  picker
//
//  Created by Jz D on 2019/11/14.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var picker = { () -> UIPickerView in
        let pick = UIPickerView()
        pick.delegate = self
        pick.dataSource = self
        return pick
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(picker)
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [picker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  50),
             picker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            picker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            picker.heightAnchor.constraint(equalToConstant: 224)
        ])
    }
}

extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let info = BeatScalar.generalRates[row]
        let general = GeneralRateItem(info.cn, info.ita, info.val)
        general.unselected()
        decorateView(pickerView, row: row)
        return general
    }
    
    func decorateView(_ picker: UIPickerView, row: Int){
        
        var frame = picker.frame
        frame.origin.y = frame.origin.y + frame.size.height * 0.42
        frame.size.height = frame.size.height * 0.16
       
        let mini = max(row-1, 0)
        let maxi = min(18, row+1)
        for i in mini...maxi{
            if i != row, let item = picker.view(forRow: i, forComponent: 0) as? GeneralRateItem{
                let f = item.convert(item.frame, to: picker)
                if frame.intersects(f) == false{
                    item.selected()
                }
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
}


extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 19
    }
}

