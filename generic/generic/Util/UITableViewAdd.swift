//
//  UITableViewAdd.swift
//  musicSheet
//
//  Created by Jz D on 2019/8/23.
//  Copyright © 2019 上海莫小臣有限公司. All rights reserved.
//

import UIKit


protocol CellReuse {
    static var id: String {get}
}



extension UITableViewCell: CellReuse{
    static var id: String{
        return String(describing: self)
        
    }
    
    
    static let placeHolder = UITableViewCell()

}




extension UITableView{
    
    func register<T: CellReuse>(for cellNib: T.Type){
        
        register(UINib(nibName: cellNib.id, bundle: nil), forCellReuseIdentifier: cellNib.id)
        
    }

    
    func dequeue<T: CellReuse>(for cellNib: T.Type) -> T{
        
        return dequeueReusableCell(withIdentifier: cellNib.id) as! T
        
    }
    
    
    func dequeue<T: CellReuse>(for cellNib: T.Type, ip indexPath: IndexPath) -> T{
        
        return dequeueReusableCell(withIdentifier: cellNib.id, for: indexPath) as! T
        
    }
    
    func cell<T: CellReuse>(_ type: T.Type, at index: Int) ->T{
        return cellForRow(at: IndexPath(row: index, section: 0)) as! T
    }
    
    func cell<T: CellReuse>(_ type: T.Type, one index: Int) ->T{
        return cellForRow(at: IndexPath(row: index, section: 1)) as! T
    }
    
    
    func cell<T: CellReuse>(_ type: T.Type, ip index: IndexPath) ->T{
        return cellForRow(at: index) as! T
    }
}







extension UITableView{
    
    func scrollTopS(_ item: Int){
        scrollToRow(at: IndexPath(row: item, section: 1), at: UITableView.ScrollPosition.middle, animated: true)
    }
    

    
}






extension UICollectionView{
    
    func register<T: CellReuse>(cell forNib: T.Type){
        register(UINib(nibName: forNib.id, bundle: nil), forCellWithReuseIdentifier: forNib.id)
    }
    
    
    func dequeue<T: CellReuse>(cell forNib: T.Type, ip indexPath: IndexPath) -> T{
        
        return dequeueReusableCell(withReuseIdentifier: forNib.id, for: indexPath) as! T
    }
    
  
}



