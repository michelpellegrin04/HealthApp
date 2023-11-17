//
//  CycleLogView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 16/11/23.
//

import SwiftUI

struct CycleLogView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Cycle Log")
                    .font(.title2)
                    .bold()
                Spacer()
                Button(action: {}) {
                    Text("Options")
                }
            }
            .padding(.leading, 25)
            .padding(.trailing, 25)
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
                
            }
            .scrollContentBackground(.hidden)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    CycleLogView()
}
