//
//  File.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/22.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit


struct ColorCluster {
    
   
    static var shared = ColorCluster()
    
    let colors = [UIColor.blue, UIColor.magenta, UIColor.red,
                  UIColor.green, UIColor.brown, UIColor.purple,
                  UIColor.cyan]
    
    var colorRegister = [String: Int]()
    var count = -1
    // 要全局，一个一个来
    
    // 原来要做分层
    
    // 我刚开始，只做里面的临时变量记录
    
    // 又加了一个外部的属性记录
    mutating func get(_ k: String) -> CGColor{
        var index = 0
        if let idx = colorRegister[k]{
            index = idx
        }
        else{
            count += 1
            if count >= colors.count{
                count = 0
            }
            index = count
            colorRegister[k] = count
        }
        return colors[index].cgColor
    }
}




extension CALayer{
    
    func debug(){
        
        // 调用他的函数栈信息
        
        // 调用他的，上一个函数，上一个类
        
        let libs: Set<String> = ["UIKitCore", "QuartzCore", "CoreFoundation"]
        var methods = [String]()
        Out: for symbol in Thread.callStackSymbols{
            for lib in libs {
                if symbol.contains(lib){
                    break Out
                }
            }
            methods.append(symbol)
        }
        var edgeColor = UIColor.black.cgColor
        if let name = methods.last{
            edgeColor = ColorCluster.shared.get(name)
        }
        borderColor = edgeColor
        borderWidth = 1
    }
}








protocol UI_debug {
    func debug( _ event: @escaping (UITapGestureRecognizer) -> Void)
}



extension UIView: UI_debug{

    func debug( _ event: @escaping (UITapGestureRecognizer) -> Void){
        
      //  isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 2
        addGestureRecognizer(tap)
     //   tap.rx.event.bind(onNext: event).disposed(by: rx.disposeBag)
    }
    
}




struct Phone {
    static let one = ""//"19921018587"
    static let two = ""//15921817053"
    
    
    static let k = "qwertyui"
}
