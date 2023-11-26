//
//  EndPoint.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String:String] { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "apitest.iqiglobal.com"
    }
    
    var header: [String: String] {
        // Access Token to use in Basic/Bearer header
        let accessToken = "n3@m0kh@0n@7f2!s0A16asdljasdaslsa8asdksd93234"
        return [
            "Authorization": accessToken,//"Bearer \(accessToken)"
            "Content-Type": "application/json"
        ]
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
}
