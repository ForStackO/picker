//
//  VIP_center.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/26.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit






 
class VIPCenterCtrl: UIViewController, SideHeaderDelegate {
    
    
    var data: VIP_centerModel?
    
    lazy var follow: UIView = { () -> UITableView in
        let tb = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        tb.backgroundColor = UIColor(rgb: 0xF3F3F3)
        tb.register(for: VIP_CenterCell.self)
        tb.separatorStyle = .none
        
        tb.delegate = self
        tb.dataSource = self
        
        return tb
    }()
    
    
    let discountHeader = VipDiscountHeader()


    lazy var h = { () -> SideHeader in
        let head = SideHeader(title: "VIP 中心")
        head.delegate = self
        return head
    }()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = UIColor(rgb: 0xF3F3F3)
        
        let white = UIView()
        white.backgroundColor = UIColor.white
        view.addSubview(white)
        doLayout()
        white.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            white.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            white.topAnchor.constraint(equalTo: view.topAnchor),
            white.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            white.heightAnchor.constraint(equalToConstant: 64)
        ])

        checkVIP()
    }
    
  
    
    func back(){}
}



extension VIPCenterCtrl: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            allPay(indexPath.row)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 60
        default:
            return 66
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        var height: CGFloat = 31
        if section == 1{
            height = 0
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height: CGFloat = 47
        if section == 1{
            height = 45
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0{
            return VIP_tipsFoot()
        }
        else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let info = data else{
            return nil
        }
        switch section {
        case 0:
            discountHeader.expire = info.vip_expiration_time
            return discountHeader
        default:
            //  1
            return VIP_records()
        }
    }
    
    
    var record_empty: Bool{
        var lessThan = true
        if let info = data, info.record.count > 0{
            lessThan = false
        }
        return lessThan
    }
    
}



extension VIPCenterCtrl: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard data != nil else{
            return 0
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let info = data else{
            return 0
        }
        if section == 0{
            return 3
        }
        else{
            return info.record.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let info = data else{
            return UITableViewCell.placeHolder
        }
        let cell = tableView.dequeue(for: VIP_CenterCell.self, ip: indexPath)
        cell.delegate = self
        if indexPath.section == 0{
            let data = info.price_lis[indexPath.row]
            cell.configMiddle(indexPath.row, data.name, data.price)
        }
        else{
            let bulk = info.record[indexPath.row]
            cell.configTail(bulk.create_time, right: bulk.content)
        }
        return cell
    }
}


extension VIPCenterCtrl: VIP_CenterCellProtocol{
    func allPay(_ index: Int) {}
        
    
}

