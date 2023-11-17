//
//  CardView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 16/11/23.
//

import SwiftUI

struct CardView: View {
    var infoCardsViewModel: InfoCardsViewModel
    var body: some View {
        VStack(alignment: .leading){
            ForEach(infoCardsViewModel.infoCards) { singleCard in
                VStack{
                    Image(singleCard.cardImage)
                        .resizable()
                        .frame(height: 200)
                    Text(singleCard.cardName)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .bold()
                    Text(singleCard.cardDescription)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }.clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                
            }
        }
        
    }
    
}

#Preview {
    CardView(infoCardsViewModel: InfoCardsViewModel())
}
