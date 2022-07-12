//
//  CoinListFunction.swift
//  coin
//
//  Created by 강조은 on 2022/07/05.
//

import Foundation
import RxSwift

protocol CoinListApiRequest {
    func requestCoinData()
    func reciveCoinData()
}

protocol CoinListRepo {
    func apiRequest()
//    func apiRequest() -> Single<[CoinListEntity]>
    func passData() -> [CoinListEntity]
}
