//
//  BotiqueAPIConfiguration.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Alamofire

final class BotiqueAPIConfiguration: APIConfigurationProtocol {
    
    var method: HTTPMethod {
        return .get
    }

    
     var parameters: RequestParams? {
        return nil
    }
    
    var path: String {
        return "/challenge/boutiques"
    }
}
