//
//  CoinDetailRepository.swift
//  coin
//
//  Created by 강조은 on 2022/07/12.
//

import Foundation
import Alamofire

class CoinDetailRepository: CoinDetailRepo {
    
    var repoData: CoinDetailEntity?
    
    func apiRequest(selectedIndex: Int) {
        let URL = "\(getUrl())\(ApiPath.coin_list.rawValue)\(selectedIndex+1)"
        print(URL)
        
        AF.request(URL, method: .get).responseJSON() { response in
            do {
                let decoder = JSONDecoder()
                switch (response.result) {
                case .success:
                    self.repoData = try decoder.decode(CoinDetailEntity.self, from: response.data!)
                    print(self.repoData)
                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error:", parsingError)
            }
        }.resume()
    }
    
    func passData() -> CoinDetailEntity {
        return repoData!
    }
}
