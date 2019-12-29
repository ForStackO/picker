
//
//  MyStudyList.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/23.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit


struct MyStudyData {
    static let shared = MyStudyData()
    
    let headerTitles = ["今日练习", "昨日练习", "前日练习", "历史练习"]

    let downOffset_header: CGFloat = 8 + 24 * 0.5
    let fill_height_header: CGFloat = 14
    let fill_width_header: CGFloat = 3
    
    let fill_y_header: CGFloat
    
    init() {
        fill_y_header = downOffset_header - fill_height_header * 0.5
    }
    
}


class MyStudyListCtrl: UIViewController {

    
    var layer_debug = false
    
    lazy var header_meningitis = MyStudyHeader(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: MyStudyHeadLayout.s_header_meningitis))
    
    
    
    lazy var follow: UIView = { () -> UITableView in
        let tb = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        tb.backgroundColor = .white
        
        tb.register(for: CircleCell.self)
        tb.register(for: PracticeDetailCell.self)
        
        tb.tableHeaderView = header_meningitis
        tb.delegate = self
        tb.dataSource = self
        /*
        tb.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.anima = .header
            self.see_study_record()
        })
        */
        tb.separatorStyle = .none
        return tb
    }()
    
    
    
    weak var delegate: MarkTitleCellDelegate?

    
    var trailing_hide_container: NSLayoutConstraint!
    
    
    var data: PracticeList?
    
    lazy var markPractice: MarkTitleView = {
        let view = MarkTitleView()
        view.delegate = self
        return view
    }()
    
    
    
    //  lastSelected. 这个用于记录
    //  selectingAssist， 这个用于选中时的标记
    //  toSelect，用来辅助记录与标记
    var selection: (lastSelected: Int, selectingAssist: Int, toSelect: Bool) = (-1, -1, true)
    
    lazy var h = { () -> SideHeader in
        let head = SideHeader(title: "我的学习")
        head.delegate = self
        return head
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor.white
        
        doLayout()
    }
    

    
    
    func willShow(){
        see_study_record()
        markPractice.tbdMark()
        
    }
    
    
}



extension MyStudyListCtrl: SideHeaderDelegate{
    func back() {
        
      
    }
    
    
}





extension MyStudyListCtrl: MarkTitleCellDelegate{
    
    func mark_MainSideContainerCtrl_close(){
        
        UIView.animate(withDuration: 0.3, animations: {
            self.trailing_hide_container.constant = 0
            self.view.layoutIfNeeded()
        }) { (yes) in
            self.trailing_hide_container = nil
        }
    }
        
        
        
    func back_ankle() {}
    
    
    
}




extension MyStudyListCtrl{
    
    
    func see_study_record(){
        

        study_record{ (resp: GeneralSingle<PracticeList>) in
            self.data = resp.data
            let myStudy = self.follow as! UITableView
            myStudy.reloadData()
        }
        
    }
    
    
   
}








extension UIViewController{


    func study_record(_ callback: @escaping (GeneralSingle<PracticeList>) -> Void){
        
        
   
        do{
            if let path = Bundle.main.url(forResource: "one", withExtension: "plist"){
                let data = try Data(contentsOf: path)
                let decoder = PropertyListDecoder()
                let info = try decoder.decode(GeneralSingle<PracticeList>.self, from: data)
                callback(info)
            }
        }
        catch let error as NSError{
            print(error)
        }
      
    
  
    }

}
