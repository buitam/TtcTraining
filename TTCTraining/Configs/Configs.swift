//
//  Configs.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
struct Production {
    static let BASE_URL: String = "https://run.mocky.io/v3/a7d526ee-5cfa-4aed-a250-b193b36589ae"
}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
