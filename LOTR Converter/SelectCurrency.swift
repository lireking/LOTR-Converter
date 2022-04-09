//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by OakHost Customer on 14/03/2022.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss //needed to close the view
    @Binding var leftCurrency: Currency // verbindet die selbe Variable auf der ContentView
    @Binding var rightCurrency: Currency // verbindet die selbe Variable auf der ContentView
    @State var gridLayout = [GridItem(), GridItem(), GridItem()] //die verschiedenen GridItems geben die Anzahl der Spalten an

    
    var body: some View {
        ZStack {
            //Background Image
            Image ("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                                
                //Currency Icons
               IconGrid(currency: $leftCurrency)
                //Text
                Text("Select the currency you would like to convert do:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Currency Icons
                IconGrid(currency: $rightCurrency)
                
                //Done Button
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece)) //.constant wird wegen dem Binding verwendet
    }
}
