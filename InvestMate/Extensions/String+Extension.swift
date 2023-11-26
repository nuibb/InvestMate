//
//  String+Extension.swift
//  InvestMate
//
//  Created by Nurul Islam on 26/11/23.
//

import Foundation

extension Optional where Wrapped == String {
    var unwrapped: String {
        return (self ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
