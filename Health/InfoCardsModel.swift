//
//  InfoCardsModel.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 16/11/23.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    let cardName: String
    var cardDescription: String
    var cardContent: String = "No content"
    var cardImage: String
}
