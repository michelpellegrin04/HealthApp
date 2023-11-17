//
//  ContentView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    
    var body: some View {
        NavigationView{
            //ScrollView{
            
            VStack{
                CycleLogView()
                List{
                    Section{
                        CalendarView()
                            .padding(-15)
                    } header:{
                        HStack{
                            Text("Highlights")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Button(action: {}) {
                                Text("Show All")
                            }
                        }
                    }
                    .headerProminence(.increased)
                    Section{
                        NavigationLink(destination: FactorsView()){
                            CycleHistoryView()
                        }
                    } header: {
                        Text("Your Cycles")
                            .font(.title2)
                            .bold()
                    }
                    .headerProminence(.increased)
                    CardView(infoCardsViewModel: InfoCardsViewModel())
                }
                
                
            }
            .background(.gray.opacity(0.1))
            
            //}
            .navigationTitle("Cycle Tracker")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
            
            
        }
    }
}

#Preview {
    ContentView()
}
