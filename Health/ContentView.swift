//
//  ContentView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
   var infoCardsViewModel = InfoCardsViewModel()
    
    var body: some View {
        NavigationView{
            //ScrollView{
            VStack{
                List{
                    Section{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                            HStack{
                                Text("Period")
                                    .frame(height: 30)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "plus")
                                    .foregroundColor(.red)
                                    .bold()
                            }
                        }
                    } header: {
                        Text("Menstruation")
                            .foregroundColor(.red)
                    }
                    .listRowBackground(Color.red.opacity(0.1))
                    
                    Section{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                            HStack{
                                Text("Symptoms")
                                    .frame(height: 30)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "plus")
                                    .foregroundColor(.purple)
                                    .bold()
                            }
                        }
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                            HStack{
                                Text("Spotting")
                                    .frame(height: 30)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "plus")
                                    .foregroundColor(.purple)
                                    .bold()
                            }
                        }
                    } header: {
                        Text("Other data")
                            .foregroundColor(.purple)
                    }
                    .listRowBackground(Color.purple.opacity(0.1))
                    Section{
                        NavigationLink(destination: FactorsView()){
                            HStack{
                                Text("Factors")
                                    .frame(height: 30)
                                Spacer()
                                Text("Pill")
                                    .bold()
                                    .foregroundStyle(Color.gray)
                            }
                        }
                    }
                    .listRowBackground(Color.gray.opacity(0.1))
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
                    .listRowBackground(Color.white)
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
                    .listRowBackground(Color.white)
                    .headerProminence(.increased)
                    ForEach(infoCardsViewModel.infoCards) { singleCard in
                        Section {
                            CardView(singleCard: singleCard)
                        }
                    }
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.gray.opacity(0.01).edgesIgnoringSafeArea(.all))
                
                
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
