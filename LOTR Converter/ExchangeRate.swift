//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by OakHost Customer on 14/03/2022.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var text: String
    @State var rightImage: String
    
    var body: some View {
        HStack {
          // Left currency image
          Image(leftImage)
               .resizable()
               .scaledToFit()
               .frame(height: 33)
                          
          // Exchange rate text
          Text(text)
                          
          // Right currency image
          Image(rightImage)
               .resizable()
               .scaledToFit()
               .frame(height:33)
          }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpenny", text: "1 Gold Penny = 1 Silverpiece", rightImage: "silverpiece")
            .previewLayout(.sizeThatFits)
    }
}
