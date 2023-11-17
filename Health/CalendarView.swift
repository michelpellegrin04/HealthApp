//
//  CalendarView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 16/11/23.
//

import SwiftUI

struct CalendarView: View {
    let calendar = Calendar.current
    @State private var selectedDate = Date()
   
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Image("cycle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("Period Prediciton")
                    .foregroundStyle(Color.indigo)
                    .bold()
            }
            //.padding(.leading, -175)
            
            Text("Your period is likely to start on or around ...")
                .font(.title2)
                .multilineTextAlignment(.leading)
                .bold()
                //.padding(.leading, -30)
            Divider()
                //.padding(.leading)
                //.padding(.trailing)
            HStack{
                Text("Mon")
                Spacer()
                Text("Tue")
                Spacer()
                Text("Wed")
                Spacer()
                Text("Thu")
                Spacer()
                Text("Fri")
                Spacer()
                Text("Sat")
                Spacer()
                Text("Sun")
            }
            .foregroundColor(.gray)
            //.padding(.bottom, 0)
            //.padding(.leading)
            //.padding(.trailing)
            
            Divider()
                //.padding(.leading)
                //.padding(.trailing)
            
        }//Vstack
        .padding()
    }
}

#Preview {
    CalendarView()
}
