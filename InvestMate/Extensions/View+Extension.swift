//
//  View+Extension.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import SwiftUI

struct ConditionalFrameModifier: ViewModifier {
    let linesAllowed: Int
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if linesAllowed > 0 {
            content
                .frame(height: CGFloat(linesAllowed) * UIFont.preferredFont(forTextStyle: .body).lineHeight)
                .fixedSize(horizontal: false, vertical: true)
        } else {
            content
        }
    }
}

extension View {
    @ViewBuilder func conditionalFrame(linesAllowed: Int) -> some View {
        self.modifier(ConditionalFrameModifier(linesAllowed: linesAllowed))
    }
    
    @ViewBuilder public func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
