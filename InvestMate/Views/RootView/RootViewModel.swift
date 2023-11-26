//
//  RootViewModel.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import Foundation

enum TimePeriod: Int, CustomStringConvertible, CaseIterable {
    case three = 3
    case five = 5
    case ten = 10
    
    var description: String {
        return String(self.rawValue) + " Years"
    }
}

enum RiskLevel: String, CustomStringConvertible, CaseIterable {
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
    
    let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }

    func getInvestmentSuggestions() {
        let payload = CalculatePayload(financialGoal: Int(targetAmount) ?? 0,
                                       duration: timePeriod.rawValue,
                                       riskLevel: riskLevel.rawValue,
                                       monthlyIncome: Int(monthlyIncome) ?? 0,
                                       monthlySavings: Int(monthlySavingsAmount) ?? 0)
        
        self.isRequesting = true
        
        Task {
            let response = await apiService.getPromptResponse(with: payload)
            if case .success(let data) = response {
                DispatchQueue.main.async {
                    self.isRequesting = false
                    Logger.log(type: .error, "[Response][Data]: \(data)")
                }
            } else if case .failure(let error) = response {
                Logger.log(type: .error, "[Request] failed: \(error.description)")
                DispatchQueue.main.async {
                    self.isRequesting = false
                    self.displayMessage(error.description)
                }
            } else {
                DispatchQueue.main.async {
                    self.isRequesting = false
                    self.displayMessage(RequestError.unknown.description)
                }
            }
        }
    }
    
    func displayMessage(_ msg: String) {
        responseMessage = msg
        Utils.after(seconds: 5.0) {
            self.responseMessage = ""
        }
    }
}
