//
//  ContentView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    @State private var isModalPresented = false
    var infoCardsViewModel = InfoCardsViewModel()
    
    var body: some View {
        NavigationView{
            //ScrollView{
            VStack{
                List{
                    FactorsView()
                        .padding(-5)
                    
                    Section{
                        Button(action: {}){
                            HStack{
                                Text("Period")
                                    .accessibilityLabel("Add period")
                                    .frame(height: 30)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "plus")
                                    .foregroundColor(.red)
                                    .bold()
                            }
                        }
                    } header: {
                        VStack(alignment: .leading){
                            HStack{
                                Text("Cycle Log")
                                    .font(.title2)
                                    .foregroundStyle(Color.black)
                                    .bold()
                                Spacer()
                                Button(action: {}) {
                                    Text("Options")
                                }
                            }
                            .padding(.bottom, 7)
                            Text("MENSTRUATION")
                                .foregroundColor(.red)
                        }
                        
                    }
                    .textCase(nil)
                    .listRowBackground(Color.red.opacity(0.1))
                    
                    Section{
                        Button(action: {}){
                            HStack{
                                Text("Symptoms")
                                    .accessibilityLabel("Add symptoms")
                                    .frame(height: 30)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "plus")
                                    .foregroundColor(.purple)
                                    .bold()
                            }
                        }
                        Button(action: {}){
                            HStack{
                                Text("Spotting")
                                    .accessibilityLabel("Add spotting")
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
                                    .accessibilityLabel("See factors")
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
                    Section{
                    } header: {
                        Text("About Cycle Tracking")
                            .font(.title2)
                            .bold()
                    }
                    .headerProminence(.increased)
                    ForEach(infoCardsViewModel.infoCards) { singleCard in
                        Section {
                            VStack(alignment: .leading, spacing: 0) {
                                Button(action: {
                                    isModalPresented.toggle()
                                }) {
                                    CardView(singleCard: singleCard)
                                }
                                .sheet(isPresented: $isModalPresented) {
                                    // Your modal content goes here
                                    Text("This is the modal for \(singleCard.cardName)")
                                }
                            }
                        }
                        .headerProminence(.increased)
                        .listSectionSeparator(.hidden)
                    }
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.gray.opacity(0.01).edgesIgnoringSafeArea(.all))
                
                
            }
            .toolbar{
                Button(action: {
                    //Here goes the action
                }) {
                    Label("Add Period", systemImage: "")
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
