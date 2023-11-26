//
//  ContentView.swift
//  InvestMate
//
//  Created by Nurul Islam on 25/11/23.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var viewModel: RootViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(AppConstants.label1)
                                .foregroundColor(viewModel.targetAmount.isEmpty ? Color.textBlack : Color.gray)
                            
                            TextField("Target Amount", text: $viewModel.targetAmount)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                        .padding(.vertical, 8)
                        
                        HStack(alignment: .top, spacing: 4) {
                            Text(AppConstants.label2)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                            
                            Picker("", selection: $viewModel.timePeriod) {
                                ForEach(TimePeriod.allCases, id: \.self) { item in
                                    Text(item.description)
                                        .font(.callout)
                                        .foregroundColor(Color.black)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .accentColor(Color.black)
                            .font(.callout.bold())
                        }
                        .padding(.vertical, 8)
                        
                        HStack(alignment: .top, spacing: 4) {
                            Text(AppConstants.label3)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                            
                            Picker("", selection: $viewModel.riskLevel) {
                                ForEach(RiskLevel.allCases, id: \.self) { item in
                                    Text(item.description)
                                        .font(.callout)
                                        .foregroundColor(Color.black)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .accentColor(Color.black)
                            .font(.callout.bold())
                        }
                        .padding(.vertical, 8)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(AppConstants.label4)
                                .foregroundColor(viewModel.monthlyIncome.isEmpty ? Color.textBlack : Color.gray)
                            
                            TextField("Mention Your Monthly Income", text: $viewModel.monthlyIncome)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                        .padding(.vertical, 8)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(AppConstants.label5)
                                .foregroundColor(viewModel.monthlySavingsAmount.isEmpty ? Color.textBlack : Color.gray)
                            
                            TextField("Your Monthly Savings Target", text: $viewModel.monthlySavingsAmount)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                        .padding(.vertical, 8)
                        
                        
                        VStack(spacing: 0) {
                            if !viewModel.responseMessage.isEmpty {
                                HStack(alignment: .center, spacing: 0) {
                                    Spacer()
                                    Text(viewModel.responseMessage)
                                        .foregroundColor(Color.primaryColor)
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                .padding()
                            }
                            
                            SwiftUI.Button(action: viewModel.getInvestmentSuggestions) {
                                HStack(alignment: .center, spacing: 12) {
                                    if viewModel.isRequesting {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    }
                                    Text(AppConstants.submitText)
                                        .foregroundColor(Color.white)
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(12.0)
                                .background(Color.primaryColor)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))
                            }
                            .disabled(viewModel.isRequesting)
                        }
                        .padding()
                        .padding(.horizontal)
                    }
                }
                
                HStack {
                    DynamicTextEditor(
                        text: $viewModel.askInvestMateText,
                        placeHolder: AppConstants.askInvestMateText,
                        linesAllowed: 3
                    )
                    
                    Spacer()
                    
                    SwiftUI.Button(action: viewModel.getInvestmentSuggestions) {
                        HStack(alignment: .center, spacing: 12) {
                            if viewModel.isRequesting {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            }
                            Text(AppConstants.sendButtonText)
                                .foregroundColor(Color.white)
                                .font(.callout)
                                .fontWeight(.semibold)
                        }
                        .padding(12.0)
                        .background(Color.primaryColor)
                        .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    }
                    .padding(.horizontal, 8)
                }
                .contentShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            .padding(.horizontal)
            .navigationBarTitle(Text(AppConstants.appTitle), displayMode: .inline)
        }
    }
}
