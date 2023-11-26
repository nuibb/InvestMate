//
//  RootViewModel.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import Foundation

enum TimePeriod: String, CustomStringConvertible, CaseIterable {
    case three = "3"
    case five = "5"
    case ten = "10"
    
    var description: String {
        return self.rawValue + " Years"
    }
}

enum RiskLevel: CustomStringConvertible, CaseIterable {
    case lowest
    case low
    case medium
    case mediumToHigh
    case higher
    case highest
    
    var description: String {
        switch self {
        case .lowest:
            return "Lowest"
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .mediumToHigh:
            return "Medium To High"
        case .higher:
            return "Higher"
        case .highest:
            return "Highest"
        }
    }
}

final class RootViewModel: ObservableObject {
    @Published var targetAmount: String = ""
    @Published var timePeriod: TimePeriod = .three
    @Published var riskLevel: RiskLevel = .low
    @Published var monthlyIncome: String = ""
    @Published var monthlySavingsAmount: String = ""
    @Published var responseMessage: String = ""
    @Published var isRequesting: Bool = false
    @Published var askInvestMateText: String = ""
    
    func getInvestmentSuggestions() {
        
    }
}
