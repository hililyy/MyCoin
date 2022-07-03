//
//  CoinListModel.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import Foundation
import Alamofire

class CoinListModel {
    static let model = CoinListModel()
    var coinListData: [CoinListEntity] = []
    var repository = CoinListRepository()
    
    func apiRequest() {
        DispatchQueue.global().sync {
            self.repository.apiRequest()
        }
    }
    
    func reciveData() {
        self.coinListData = repository.passData()
    }

}
