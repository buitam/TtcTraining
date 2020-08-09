//
//  Auth.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class Auth: Mappable {
    var tokenType: String?
    var expiresIn: Int?
    var accessToken: String?
    var refreshToken: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
    }
}
