//
//  ApiUrlUtils.swift
//  coin
//
//  Created by 강조은 on 2022/07/05.
//

import Foundation

let baseURL = "https://api.coinpaprika.com/"
func getUrl() -> String {
    return baseURL
}
enum ApiPath: String {
    case coin_list = "v1/coins/"
}

