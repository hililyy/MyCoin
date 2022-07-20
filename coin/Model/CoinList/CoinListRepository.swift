//
//  CoinListRepository.swift
//  MyCoin
//
//  Created by 강조은 on 2022/06/28.
//

import RxSwift
import SwiftyJSON
import Alamofire
import RxAlamofire
import RxCocoa
import Foundation
import UIKit

let disposeBag = DisposeBag()

class CoinListRepository: CoinListRepo {
    let url = "\(getUrl())\(ApiPath.coin_list.rawValue)"
    var repoData: [CoinListEntity] = []
    var pRepoData = [CoinListEntity] = []
    
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

    func apiRequset() {
        Observable.just(url)
            .map{ URL(string: $0)! }
            .map{ url -> URLRequest in
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                return request
            }
            .flatMap{ request -> Observable<(response: HTTPURLResponse, data: Data) > in
                return URLSession.shared.rx.response(request: request)}
            .filter { responds, _ in
                return 200..<300 ~= responds.statusCode
            }
            .map{ _, data -> [[String: Any]] in
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []),
                      let result = json as? [[String: Any]] else {
                    return []
                }
                return result
            }
            .filter{ result in
                return result.count > 0}
            .map { objects in
                return objects.compactMap { dic -> CoinListEntity? in
                    guard let id = dic["id"] as? String,
                          let name = dic["name"] as? String,
                          let symbol = dic["symbol"] as? String,
                          let rank = dic["rank"] as? Int,
                          let is_new = dic["is_new"] as? Bool,
                          let is_active = dic["is_active"] as? Bool,
                          let type = dic["type"] as? String else {
                        return nil
                    }
                    return CoinListEntity(id:id, name:name, symbol:symbol,rank:rank,is_new:is_new,is_active:is_active,type:type )
            }}
            .subscribe(onNext: { [weak self] newRepositories in
                self?.pRepoData.onNext(newRepositories)
            })
                
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
    
    func getResultCodeFromApi(json: JSON) -> Int {
        json["rt"].intValue
    }
    
    func passData() -> [CoinListEntity] {
        return repoData
    }
}
