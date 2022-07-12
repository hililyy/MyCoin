//
//  CoinDetailModel.swift
//  coin
//
//  Created by 강조은 on 2022/07/12.
//

import Foundation

class CoinDetailModel {
    static let model = CoinDetailModel()
    var coinDetailData: CoinDetailEntity!
    var repository = CoinDetailRepository()
    var selectedIndex: Int?
}
extension CoinDetailModel: CoinDetailApiRequest {
    func requestCoinDetailData(selectedIndex: Int) {
        DispatchQueue.global().sync {
            self.repository.apiRequest(selectedIndex: selectedIndex)
        }
    }
    
    func reciveCoinDetailData() {
        self.coinDetailData = repository.passData()
    }
}
