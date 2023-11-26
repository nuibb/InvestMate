//
//  InvestmentPayload.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import Foundation

struct InvestmentPayload: Encodable {
    var prompt: String
    var withData: String
    
    init(prompt: String, withData: String) {
        self.prompt = prompt
        self.withData = withData
    }
    
    enum CodingKeys: String, CodingKey {
        case prompt = "prompt"
        case withData = "with_data"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(withData, forKey: .withData)
    }
}
