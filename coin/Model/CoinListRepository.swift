//
//  CoinListRepository.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import Foundation
import Alamofire

class CoinListRepository: CoinListRepo {
    let URL = "\(getUrl())\(ApiPath.coin_list.rawValue)"
    var repoData: [CoinListEntity] = []
    
    func apiRequest() {
        AF.request(URL, method: .get).responseJSON() { response in
            do {
                let decoder = JSONDecoder()
                switch (response.result) {
                case .success:
                    self.repoData = try decoder.decode([CoinListEntity].self, from: response.data!)
                    
                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error:", parsingError)
            }
        }.resume()
    }
    
    func passData() -> [CoinListEntity] {
        return repoData
    }
}
