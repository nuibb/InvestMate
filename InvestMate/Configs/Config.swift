//
//  Config.swift
//  InvestMate
//
//  Created by Nurul Islam on 26/11/23.
//

import Foundation

struct Config {
    
    struct log {
        static let enabled = true
    }
    
    struct constant {
        static var applicationGroupIdentifier: String {
            guard let applicationGroupIdentifier = Bundle.main.object(forInfoDictionaryKey: "applicationGroupIdentifier") as? String else {
                fatalError("applicationGroupIdentifier should be defined")
            }
            return applicationGroupIdentifier
        }
    }
}
