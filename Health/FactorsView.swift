//
//  FactorsView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 15/11/23.
//

import SwiftUI

struct FactorsView: View {
    @State private var showCircle = false
    var body: some View {
        VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 200, height: 100)
                            .foregroundColor(.blue)
                        
                        if showCircle {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            showCircle.toggle()
                        }
                    }

                    Button("Mostrar/ocultar círculo") {
                        withAnimation {
                            showCircle.toggle()
                        }
                    }
                }
                .padding()
    }
}

#Preview {
    FactorsView()
}
