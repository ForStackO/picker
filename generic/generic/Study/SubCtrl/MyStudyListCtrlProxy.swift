//
//  MyStudyListCtrlProxy.swift
//  musicSheet
//
//  Created by Jz D on 2019/11/7.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit




extension MyStudyListCtrl: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let condition = (indexPath.section == 0 && indexPath.row == 0)
        guard !condition else {
            return 111
        }
        switch indexPath.row {
        case 0:
            return 119
        default:
            return 62
        }
    }
    
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let info = data else{
            if layer_debug{
                let v = UIView.white
                v.layer.debug()
                return v
            }
            return UIView.white
        }
        let piece = info.scores_data_list[section].total_data
        let content = info.scores_data_list[section].score_data
        guard section > 0 else {
            if content.count == 0{
                markPractice.empty()
            }
            else{
                markPractice.config_pneumonia(contrast: info.clock)
            }
            header_meningitis.config_thrombosis(piece.percent, content: piece.content)
            if layer_debug{
                markPractice.layer.debug()
            }
            return markPractice
        }
        let title = MyStudyData.shared.headerTitles[section]
        let shareInfo = TitlePracticeView()
        switch section{
        case 3:
            shareInfo.config(title)
        default:
            if content.count == 0{
                shareInfo.empty(title)
            }
            else{
                shareInfo.config(title, per: piece.percent, tip: piece.content)
            }
        }
        if layer_debug{
            shareInfo.layer.debug()
        }
        return shareInfo
    }
    
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let info = data else{
            return UITableViewCell.placeHolder
        }
        let sectionData = info.scores_data_list[section]
        let filter = sectionData.scoresFiltered
        switch filter.1 {
        case .more:
            let foot = MorePracticeFooter()
            foot.delegate = self
            var env = (selection.selectingAssist == section)
            if selection.selectingAssist == section{
                env = selection.toSelect
            }
            foot.state = env
            foot.section = section
            return foot
        case .normal:
            return nil
        case .notPracticed:
            return I_have_not_learningFooter()
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let info = data else{
            return CGFloat.zero
        }
        let sectionData = info.scores_data_list[section]
        let filter = sectionData.scoresFiltered
        switch filter.1 {
        case .more:
            return 43 + 3
        case .normal:
            return CGFloat.zero
        case .notPracticed:
            return 97 - 40
        }
        
    }
    // 先限制，最外部的尺寸
    // 做适配
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var h: CGFloat = 25 + 8 * 4
        switch section {
        case 0:
            h += 30
        case 3:
            ()
        default:
            h += 18
        }
        return h
    }
}



extension MyStudyListCtrl: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let info = data else{
            return 0
        }
        return info.scores_data_list.count
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let info = data else{
            return 0
        }
        let data: ScoresDataList = info.scores_data_list[section]
        if selection.selectingAssist == section, selection.toSelect{
            var count = data.scoreListValid.count
            if count <= 0{
                count = 0
            }
            else{
                count += 1
            }
            return count
        }
        else{
            var count = data.scoresFiltered.0.count
            if count <= 0{
                count = 0
            }
            else{
                count += 1
            }
            return count
        }
        
    }
    
    
    
    
    
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let info = data else{
            return UITableViewCell.placeHolder
        }
        let sectionData = info.scores_data_list[indexPath.section]
        var sectionItems = sectionData.scoresFiltered.0
        if selection.selectingAssist == indexPath.section{
            sectionItems = sectionData.scoreListValid
        }
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(for: CircleCell.self, ip: indexPath)
            var position = PracticeDetailPosition.middle
            if indexPath.section == 0{
                position = PracticeDetailPosition.begin
            }
            if indexPath.section == 3{
                position = PracticeDetailPosition.end
            }
            let cake = sectionData.total_data
            cell.config(cake.scores_nums, practicesNum: cake.total_nums, lastsNum: cake.total_length, position: position)
            if layer_debug{
                cell.layer.debug()
            }
            return cell
        default:
            let cell = tableView.dequeue(for: PracticeDetailCell.self, ip: indexPath)
            let nougat = sectionItems[indexPath.row - 1]
            cell.config(indexPath.row, title: nougat.scores_name, times: nougat.nums, duration: nougat.length, start: indexPath.row == 1)
            if layer_debug{
                cell.layer.debug()
            }
            return cell
        
        
        }
    }
    
    
}











extension MyStudyListCtrl: MorePracticeFooterDelegate{
    
    func showMorePractice(_ state: Bool, section: Int) {
        guard section >= 0 else {
            return
        }
        selection.toSelect = !state
        selection.selectingAssist = section
        let myStudy = follow as! UITableView
        if selection.lastSelected >= 0 && selection.lastSelected != section{
            myStudy.reloadSections([section, selection.lastSelected], with: UITableView.RowAnimation.automatic)
        }
        else{
            myStudy.reloadSections([section], with: UITableView.RowAnimation.automatic)
        }
        selection.lastSelected = section

    }
    
}
