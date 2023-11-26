//
//  ApiService.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import Foundation

struct ApiService: GPTDataFetchable {
    static let shared = ApiService()
    let networkMonitor: NetworkMonitor = NetworkMonitor()
    private init() {}
}
