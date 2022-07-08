//
//  CoinListViewModel.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import Foundation
import UIKit

class CoinListViewModel {
    static let viewModel = CoinListViewModel()
    var newCoinBtnInfo: Bool = true
    var activeCoinBtnInfo: Bool = true
    let model = CoinListModel.model
    
    func getCoinListData() -> [CoinListEntity] {
        return model.coinListData
    }
    
    func settingCoinCategory(indexPath: Int) -> CGFloat {
        if model.coinListData[indexPath].type == "coin" {
            if self.activeCoinBtnInfo == true && self.newCoinBtnInfo == true {
                if model.coinListData[indexPath].is_active == true || model.coinListData[indexPath].is_new == true {
                    return 57
                } else {
                    return 0
                }
            } else if self.activeCoinBtnInfo == true && self.newCoinBtnInfo == false {
                if model.coinListData[indexPath].is_active == true && model.coinListData[indexPath].is_new == false {
                    return 57
                } else {
                    return 0
                }
            } else if self.activeCoinBtnInfo == false && self.newCoinBtnInfo == true {
                if model.coinListData[indexPath].is_active == false && model.coinListData[indexPath].is_new == true {
                    return 57
                } else {
                    return 0
                }
            } else if self.activeCoinBtnInfo == false && self.newCoinBtnInfo == false {
                if model.coinListData[indexPath].is_active == false && model.coinListData[indexPath].is_new == false {
                    return 57
                } else {
                    return 0
                }
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
}

extension CoinListViewModel: CoinListApiRequest {
    func requestCoinData() {
        model.requestCoinData()
    }
    
    func reciveCoinData() {
        model.reciveCoinData()
    }
}
