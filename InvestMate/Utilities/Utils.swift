//
//  Utils.swift
//  InvestMate
//
//  Created by Nurul Islam on 26/11/23.
//

import Foundation

struct Utils {
    static func after(seconds: Double, callback:@escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            callback()
        }
    }
}
