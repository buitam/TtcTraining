//
//  BaseResponse.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse<T: Mappable>: Mappable {
    var status: String?
    var code: Int?
    var message: String?
    var data: T?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        data <- map["data"]
    }
    
    func isSuccessCode() -> Bool? {
        return code == 200
    }
}


class BaseResponseError {
    var mErrorType: NetworkErrorType!
    var mErrorCode: Int!
    var mErrorMessage: String!
    
    init(_ errorType: NetworkErrorType,_ errorCode: Int,_ errorMessage: String) {
        mErrorType = errorType
        mErrorCode = errorCode
        mErrorMessage = errorMessage
    }
}
