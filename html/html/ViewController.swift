//
//  ViewController.swift
//  html
//
//  Created by Jz D on 2019/12/20.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var content: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var memo = "<p style=\"color: #333333;font-size:16px;\">好多曲谱是全球首款突破乐器极限，实现弹奏跟随，自动翻页，复音辨识的专业陪练软件。不需要硬件支持，我们也能陪伴你的每一次进步，记录下你的每一次进步。</p><p style=\"color: #333333;font-size:15px;\">功能特点:</p> <ul style=\"color: #333333;font-size:16px; margin: 0%; padding: 0%;  float: left;\"><li style=\"margin: 0%; padding: 0%; float: left;\">快乐练琴为主旨。再小的进步好多曲谱也看得见！</li><li  style=\"float: left; -webkit-margin-before:0; -webkit-margin-after: 0; -webkit-margin-start: 0; -webkit-margin-end: 0; -webkit-padding-start:0\">弹奏跟随，自动翻页，释放你的双手！</li><li style=\"margin: 0%; padding: 0%; float: left;\">拥有伴音，节拍器，放大缩小曲谱等功能，满足你的练琴需求！</li><li style=\"margin: 0%; padding: 0%; float: left;\">标准化示范音，练习有参照！</li><li  style=\"margin: 0%; padding: 0%; float: left;\">每日练习记录，每天的进步都看得见！</li><li style=\"margin: 0%; padding: 0%; float: left;\">实时更新与同级儿童相比的进度，练习节奏全把握！</li></ul>"
        
        
        memo = "<p style=\"color: #333333;font-size:16px;\">好多曲谱是全球首款突破乐器极限，实现弹奏跟随，自动翻页，复音辨识的专业陪练软件。不需要硬件支持，我们也能陪伴你的每一次进步，记录下你的每一次进步。</p><p style=\"color: #333333;font-size:15px;\"><div style=\"color: #333333;font-size:16px; margin: 0%; padding: 0%;  float: left;\">功能特点:</p><p style=\"margin: 0%; padding: 0%; float: left;\">&#160• 快乐练琴为主旨。再小的进步好多曲谱也看得见！</p><p  style=\"float: left; -webkit-margin-before:0; -webkit-margin-after: 0; -webkit-margin-start: 0; -webkit-margin-end: 0; -webkit-padding-start:0\">&#160• 弹奏跟随，自动翻页，释放你的双手！</p><p style=\"margin: 0%; padding: 0%; float: left;\">&#160• 拥有伴音，节拍器，放大缩小曲谱等功能，满足你的练琴需求！</p><p style=\"margin: 0%; padding: 0%; float: left;\">&#160• 标准化示范音，练习有参照！</p><p  style=\"margin: 0%; padding: 0%; float: left;\">&#160• 每日练习记录，每天的进步都看得见！</p><p style=\"margin: 0%; padding: 0%; float: left;\">&#160• 实时更新与同级儿童相比的进度，练习节奏全把握！</p></div>"
        
        
        memo = "<p style=\"color: #333333;font-size:16px;\">好多曲谱是全球首款突破乐器极限，实现弹奏跟随，自动翻页，复音辨识的专业陪练软件。不需要硬件支持，我们也能陪伴你的每一次进步，记录下你的每一次进步。</p><p style=\"color: #333333;font-size:15px;\">功能特点:</p> <ul style=\"color: #333333;font-size:16px;padding-left: 0;\"><li>快乐练琴为主旨。再小的进步好多曲谱也看得见！</li><li>弹奏跟随，自动翻页，释放你的双手！</li><li>拥有伴音，节拍器，放大缩小曲谱等功能，满足你的练琴需求！</li><li>标准化示范音，练习有参照！</li><li>每日练习记录，每天的进步都看得见！</li><li>实时更新与同级儿童相比的进度，练习节奏全把握！</li></ul>"
        
        
        
        guard let data = memo.data(using: String.Encoding.unicode) else { return }
        do {
            content.attributedText = try NSAttributedString(data: data, options: [.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch let error as NSError {
            print(error)
        }
        
        content.numberOfLines = 0
        
        
    }


}

