//
//  FocusedTextEditor.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//


import SwiftUI

@available(iOS 15.0, *)
struct FocusedTextEditor: View {
    @FocusState private var isFocused: Bool
    @Binding var text: String
    let placeHolder: String
    let linesAllowed: Int
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .padding(.leading, 8)
                .padding(.trailing, 5)
                .font(.subheadline)
                .foregroundColor(Color.textBlack)
                .conditionalFrame(linesAllowed: linesAllowed)
                .focused($isFocused)
            
            Text(placeHolder)
                .foregroundColor(.black.opacity(0.25))
                .padding(.leading, 12)
                .padding(.top, 5)
                .hidden(!text.isEmpty)
                .onTapGesture {
                    isFocused = true
                }
            
        }
        .background(Color.white)
        .cornerRadius(5)
    }
}
