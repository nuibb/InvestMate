//
//  CalculatePayload.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import Foundation

struct CalculatePayload: Encodable {
    var financialGoal: Int
    var duration: Int
    var riskLevel: String
    var monthlyIncome: Int
    var monthlySavings: Int
    
    init(financialGoal: Int, duration: Int, riskLevel: String, monthlyIncome: Int, monthlySavings: Int) {
        self.financialGoal = financialGoal
        self.duration = duration
        self.riskLevel = riskLevel
        self.monthlyIncome = monthlyIncome
        self.monthlySavings = monthlySavings
    }
    
    enum CodingKeys: String, CodingKey {
        case financialGoal = "financial_goal"
        case duration = "duration"
        case riskLevel = "risk_level"
        case monthlyIncome = "monthly_income"
        case monthlySavings = "monthly_savings"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(financialGoal, forKey: .financialGoal)
        try container.encode(duration, forKey: .duration)
        try container.encode(riskLevel, forKey: .riskLevel)
        try container.encode(monthlyIncome, forKey: .monthlyIncome)
        try container.encode(monthlySavings, forKey: .monthlySavings)
    }
}
