//
//  CoinListModel.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import Foundation
import Alamofire
import RxSwift

class CoinListModel {
    static let model = CoinListModel()
    var coinListData: [CoinListEntity] = []
    var repository = CoinListRepository()
}

extension CoinListModel: CoinListApiRequest {
    func requestCoinData() {
        DispatchQueue.global().sync {
            self.repository.apiRequest()
        }
    }
    
    func reciveCoinData() {
        self.coinListData = repository.passData()
    }
}
