import Foundation


struct PracticeList: Decodable{
    let clock: Int
    let is_clock: Int
    
    let scores_data_list: [ScoresDataList]
    
}




struct ScoresDataList: Decodable{
    
    let score_data: [ScoreData]
    
    let total_data: TotalData
    
}



enum ScoreFooterOption{
    case normal, more, notPracticed
}


extension ScoresDataList{
    var scoresFiltered: ([ScoreData], ScoreFooterOption){
        if score_data.count > 2{
            return (Array(score_data[0...1]), ScoreFooterOption.more)
        }
        else if score_data.count <= 0{
            return ([], ScoreFooterOption.notPracticed)
        }
        else{
            return (score_data, ScoreFooterOption.normal)
        }
    }
    
    
    var scoreListValid: [ScoreData]{
        if score_data.count > 30{
            return Array(score_data[0...29])
        }
        else{
            return score_data
        }
    }
    
}


struct ScoreData: Decodable{
    
    let length: Int
    let nums: Int
    let scores_name: String
    
    
}





struct TotalData: Decodable{
    
    let content: String?
    let contrast: WhatSoEver?
    let scores_nums: Int
    
    
    let total_length: Int
    let total_nums: Int
    
}



extension TotalData{
    var percent: Int{
        return contrast?.scalar ?? 0
    }
}





enum WhatSoEverError:Error {
    case missingValue
}



enum WhatSoEver: Decodable, Hashable{

    case val(Double), patrol(Float), int(Int), txt(String)

       init(from decoder: Decoder) throws {
           if let value = try? decoder.singleValueContainer().decode(Double.self) {
               self = .val(value)
               return
           }
        
            if let gotIt = try? decoder.singleValueContainer().decode(Float.self) {
                self = .patrol(gotIt)
                return
            }
        
            if let text = try? decoder.singleValueContainer().decode(String.self) {
                self = .txt(text)
                return
            }
            
            if let int = try? decoder.singleValueContainer().decode(Int.self) {
                self = .int(int)
                return
            }

           throw WhatSoEverError.missingValue
       }

    var float: Float{
        switch self {
        case .val(let doub):
            return Float(doub)
        case .patrol(let pat):
            return pat
        case .int(let interg):
            return Float(interg)
        case .txt(let text):
            return Float(text) ?? 0
        }
    }
    
    
    
    var scalar: Int{
        switch self {
        case .val(let doub):
            return Int(doub)
        case .patrol(let pat):
            return Int(pat)
        case .int(let interg):
            return interg
        case .txt(let text):
            return Int(text) ?? 0
        }
    }
    
    
    
    func hash(into hasher: inout Hasher){
        
        switch self {
        case .val(let val):
            hasher.combine(val)
        case .patrol(let val):
            hasher.combine(val)
        case .int(let val):
            hasher.combine(val)
        case .txt(let val):
            hasher.combine(val)
        }
        
        
    }
    
}


