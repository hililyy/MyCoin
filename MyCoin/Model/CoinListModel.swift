//
//  CoinListModel.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import Foundation
import Alamofire

class CoinListModel {
    static let model = CoinListModel()
    var coinListData: [CoinListEntity] = []
    var repository = CoinListRepository()
    func apiRequest() {
        DispatchQueue.global().sync {
            self.repository.apiRequest()
        }
    }
    func reciveData() {
        self.coinListData = repository.passData()
        print("printCoinListData : \(self.coinListData)")
    }
//    func apiRequest() {
//        let URL = "https://api.coinpaprika.com/v1/coins"
//        AF.request(URL, method: .get).responseJSON() { response in
//            do{
//                let decoder = JSONDecoder()
//                switch (response.result) {
//                case .success:
//                    self.coinListData = try decoder.decode([CoinListEntity].self, from: response.data!)
//                case .failure(let error):
//                    print("errorCode: \(error._code)")
//                    print("errorDescription: \(error.errorDescription!)")
//                }
//            } catch let parsingError {
//                print("Error:", parsingError)
//            }
//        }.resume()
//    }
}
