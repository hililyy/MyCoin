//
//  CoinListEntity.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import Foundation
struct CoinListEntity: Codable {
    let id: String?
    let name: String?
    let symbol: String?
    let rank: Int?
    let isNew: Bool?
    let isActive: Bool?
    let type: String?
}
