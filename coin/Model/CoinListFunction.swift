//
//  CoinListFunction.swift
//  coin
//
//  Created by 강조은 on 2022/07/05.
//

import Foundation

protocol CoinListApiRequest {
    func requestCoinData()
    func reciveCoinData()
}

protocol CoinListRepo {
    func apiRequest()
    func passData() -> [CoinListEntity]
}
