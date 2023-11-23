//
//  CardView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 16/11/23.
//

import SwiftUI

struct CardView: View {
    let singleCard: Card
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(singleCard.cardImage) // Replace "yourImageName" with the actual name of your image asset
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            VStack(alignment: .leading, spacing: 10) {
                Text(singleCard.cardName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(singleCard.cardDescription)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding()
        
    }
    
}

#Preview {
    CardView(singleCard: Card(cardName: "Learn About Menstrual Cycles", cardDescription: "Tracking cycles can tell you more about your health.", cardImage: "card1"))
}
