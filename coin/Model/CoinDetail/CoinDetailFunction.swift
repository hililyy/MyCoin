//
//  CoinDetailFunction.swift
//  coin
//
//  Created by 강조은 on 2022/07/12.
//

import Foundation

protocol CoinDetailApiRequest {
    func requestCoinDetailData(selectedIndex: Int)
    func reciveCoinDetailData()
}

protocol CoinDetailRepo {
    func apiRequest(selectedIndex: Int)
    func passData() -> CoinDetailEntity
}
