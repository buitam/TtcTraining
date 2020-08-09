//
//  Configs.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
struct Production {
    static let BASE_URL: String = "https://run.mocky.io/v3/a2238982-9be4-472b-a537-0c3fe6da44af"
}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
