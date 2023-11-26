//
//  DynamicTextEditor.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//


import SwiftUI

struct DynamicTextEditor: View {
    @Binding var text: String
    let placeHolder: String
    let linesAllowed: Int
    @State var hidePlaceHolder = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            if #available(iOS 15, *) {
                FocusedTextEditor(text: $text, placeHolder: placeHolder, linesAllowed: linesAllowed)
            } else {
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $text)
                        .padding(.leading, 8)
                        .padding(.trailing, 5)
                        .font(.subheadline)
                        .foregroundColor(.textBlack)
                        .conditionalFrame(linesAllowed: linesAllowed)
                        .onChange(of: text) { _ in
                            hidePlaceHolder = text.isEmpty ? false : true
                        }
                    
                    Text("Enter remarks")
                        .foregroundColor(.black.opacity(0.25))
                        .padding(.leading, 12)
                        .padding(.top, 5)
                        .hidden(hidePlaceHolder)
                        .onTapGesture {
                            hidePlaceHolder = true
                        }
                    
                }
                .background(Color.white)
                .cornerRadius(5)
            }
        }
        .onAppear {
            hidePlaceHolder = text.isEmpty ? false : true
        }
    }
}
