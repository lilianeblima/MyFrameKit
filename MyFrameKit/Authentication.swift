//
//  Authentication.swift
//  MyFramework
//
//  Created by Liliane Lima on 10/07/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import Foundation
import Alamofire

open class Authentication {
    
    public init() {}
    
    open func requestToken(clientSecret: String, clientId: String, completionHandler: @escaping (_ token: String?) -> ()) {
        let parameter = [
            "client_id"     :clientId,
            "client_secret" : clientSecret,
            "grant_type"    : "client_credentials"
        ]
        let url = "https://api.yotpo.com/oauth/token"
        Alamofire.request(url, method: .post, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success:
                
                guard let JSON = response.result.value as? [String: AnyObject], 
                let token = JSON["access_token"] as? String else {
                    completionHandler(nil)
                    return
                }
                completionHandler(token)
                
            case .failure:
                completionHandler(nil)
                return
            }
        }
        
    }
}

