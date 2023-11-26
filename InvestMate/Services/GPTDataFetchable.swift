//
//  ApiFetchable.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import Foundation

protocol GPTDataFetchable: HTTPClient {
    func getPromptResponse(with payload: CalculatePayload) async -> Swift.Result<String, RequestError>
    func getPromptResponse(with payload: InvestmentPayload) async -> Swift.Result<String, RequestError>
}

extension GPTDataFetchable {
    func getPromptResponse(with payload: CalculatePayload) async -> Swift.Result<String, RequestError> {
        if self.networkMonitor.isConnected {
            return await postRequest(endpoint: ApiEndPoints.calculate, payload: payload, responseModel: String.self)
        } else {
            return .failure(.networkNotAvailable)
        }
    }
    
    func getPromptResponse(with payload: InvestmentPayload) async -> Swift.Result<String, RequestError> {
        if self.networkMonitor.isConnected {
            return await postRequest(endpoint: ApiEndPoints.investment, payload: payload, responseModel: String.self)
        } else {
            return .failure(.networkNotAvailable)
        }
    }
}


