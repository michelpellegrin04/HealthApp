//
//  CycleHistoryView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 16/11/23.
//

import SwiftUI

struct CycleHistoryView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Cycle History")
                .bold()
                .foregroundStyle(Color.indigo)
            HStack{
                Text("Current Cycle:")
                    .bold()
                Text("Date of the current cycle")
            }
            /*HStack{
                //If theres factors then show factors
                Text("Factors:")
                    .bold()
                    .foregroundStyle(Color.gray.opacity(0.8))
                Text("Pill")
                    .foregroundStyle(Color.gray.opacity(0.8))
            }*/
            Text("Dias de periodo")
                .foregroundStyle(Color.gray.opacity(0.8))
        }
    }
}

#Preview {
    CycleHistoryView()
}
