//
//  String+Extension.swift
//  InvestMate
//
//  Created by Nurul Islam on 26/11/23.
//

import Foundation

extension String {
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = .current
        formatter.locale = .current
        return formatter.string(from: self)
    }
}
