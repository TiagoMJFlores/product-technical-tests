//
//  BoutiqueListService.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Alamofire

protocol BoutiqueListServiceProtocol {
    func doRequest(completionHandler:( @escaping ([MapItem]) -> Void))
}

struct BoutiqueListService: BoutiqueListServiceProtocol {
    
    func doRequest(completionHandler:( @escaping ([MapItem]) -> Void)) {
        AF.request(BotiqueAPIConfiguration()).validate(statusCode: 200..<299)
            .responseDecodable { (response: AFDataResponse<[MapItem]>)  in
              
                switch response.result {
                case let .failure(error):
                            print(error)
                     
                default:
                    guard let data = response.value else { return }
                    completionHandler(data)
                    break
               
                }
        }
    }
}
