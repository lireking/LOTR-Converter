//
//  ContentView.swift
//  LOTR Converter
//
//  Created by OakHost Customer on 13/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    
    var body: some View {
        ZStack {
            //Background image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Prancing pony image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                // Currency conversion section
                HStack {
                    // Left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        // Text field
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            }
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    // Right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            // Currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        // Text field
                        TextField("Amount", text: $rightAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                    }
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                                
                // Info button
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                        
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                       Exchangeinfo()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
