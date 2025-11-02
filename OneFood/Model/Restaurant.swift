//
//  Restaurant.swift
//  OneFood
//
//  Created by Omar Khodr on 02.11.2025.
//

import Foundation
import SwiftUI

struct Restaurant: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var deliveryFee: Float
    var deliveryTimeMin: Int
    var rating: Float
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // TODO: add the rest of the fields later:
//    var address: String
//    var description: String
    
//    var distance: Float
//    var isFavorite: Bool
}
