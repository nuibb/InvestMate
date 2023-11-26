//
//  ApiEndPoints.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import Foundation

enum ApiEndPoints: Endpoint {
    case calculate
    case investment
}

extension ApiEndPoints {
    
    //MARK: path should have a leading '/'
    var path: String {
        switch self {
        case .calculate:
            return "/api/v1/chats/calculate"
        case .investment:
            return "/api/v1/chats/investment';"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .calculate, .investment:
            return .post
        }
    }
}

