//
//  CoinDetailViewModel.swift
//  coin
//
//  Created by 강조은 on 2022/07/12.
//

import Foundation

class CoinDetailViewModel {
    static let viewModel = CoinDetailViewModel()
    let model = CoinDetailModel.model
    var selectedIndex: Int?
    
    func getCoinDetailData() -> CoinDetailEntity {
        print( model.coinDetailData)
        return model.coinDetailData
    }
    
}
extension CoinDetailViewModel: CoinDetailApiRequest {
    func requestCoinDetailData(selectedIndex: Int) {
        model.requestCoinDetailData(selectedIndex: selectedIndex)
    }
    
    func reciveCoinDetailData() {
        model.reciveCoinDetailData()
    }
    
}

