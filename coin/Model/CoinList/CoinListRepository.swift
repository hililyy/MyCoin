//
//  CoinListRepository.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import Foundation
import RxSwift
import SwiftyJSON
import Alamofire
import RxAlamofire
import RxCocoa

let disposeBag = DisposeBag()

class CoinListRepository: CoinListRepo {
    let URL = "\(getUrl())\(ApiPath.coin_list.rawValue)"
    var repoData: [CoinListEntity] = []
    var pRepoData = PublishSubject<[CoinListEntity]>()
    
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

//    func apiRequest() -> Single<[CoinListEntity]> {
//        return RxAlamofire.request(
//                           .get,
//                           baseURL,
//                           parameters: nil,
//                           encoding: JSONEncoding.default
//        )
//        .responseJSON()
//        .asSingle()
//        //소비자가 없어서 mpa 내부가 실행이 안됨 dispose -> 둘의 관계를 만들어줌
//        //소비자 만들기..........
//        .map{ result in
//            guard let resultData = result.data else { throw ErrorCase.NILL_OR_EMPTY }
//            print(result)
//            let jsonResult = JSON(resultData)
//
//            switch self.getResultCodeFromApi(json: jsonResult) {
//            case 200:
//                let temp: [CoinListEntity] = try
//                JSONDecoder()
//                    .decode([CoinListEntity].self, from: resultData)
//                return temp
//            default :
//                throw ErrorCase.UNKOWN
//            }
//        }
//    }
    
//        func apiRequest() {
//            requestJSON(.get, baseURL)
//                .map { response -> [CoinListEntity] in
//                    let data = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
//                    let coinListData = try JSONDecoder().decode(CoinResult.self, from: data)
//                    return coinListData.items
//                }.subscribe(onNext: {
//                    result in self.repoData = result
//                })
//                .disposed(by: disposeBag)
//
//            print(repoData)
//        }
    
//    func apiRequest() {
//        Observable.just(URL)
//            .map {
//                urlString -> URL in
//                return URL(string: URL)!
//            }
//            .map {
//                url -> URLRequest in
//                var request = URLRequest(url: url)
//                request.httpMethod = "GET"
//                return request
//            }
//    }
    
    func getResultCodeFromApi(json: JSON) -> Int {
        json["rt"].intValue
    }
    
    func passData() -> [CoinListEntity] {
        return repoData
    }
}
