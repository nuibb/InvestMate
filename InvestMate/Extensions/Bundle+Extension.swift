//
//  Bundle+Extension.swift
//  InvestMate
//
//  Created by Nurul Islam on 26/11/23.
//

import Foundation

extension Bundle {
    var isProduction: Bool {
    #if DEBUG
        return false
    #else
        guard let path = self.appStoreReceiptURL?.path else {
            return true
        }
        return !path.contains("sandboxReceipt")
    #endif
    }
}
