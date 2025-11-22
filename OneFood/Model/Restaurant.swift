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
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // TODO: add the rest of the fields later:
//    var address: String
//    var description: String
    
//    var distance: Float
//    var isFavorite: Bool
}

//struct MockData {
//    static let sampleRestaurant = Restaurant(
//        id: 0,
//        name: "Test Restaurant",
//        deliveryFee: 1.5,
//        deliveryTimeMin: 30,
//        rating: 4.2,
//        imageName: "kfc"
//    )
//    static let sampleRestaurant1 = Restaurant(
//        id: 1,
//        name: "Test Restaurant 1",
//        deliveryFee: 1.5,
//        deliveryTimeMin: 30,
//        rating: 4.2,
//        imageName: "zwz"
//    )
//    static let sampleRestaurant2 = Restaurant(
//        id: 2,
//        name: "Test Restaurant 2",
//        deliveryFee: 1.5,
//        deliveryTimeMin: 30,
//        rating: 4.2,
//        imageName: "kfc"
//    )
//    static let sampleRestaurant3 = Restaurant(
//        id: 3,
//        name: "Test Restaurant 3",
//        deliveryFee: 1.5,
//        deliveryTimeMin: 30,
//        rating: 4.2,
//        imageName: "zwz"
//    )
//    static let sampleRestaurant4 = Restaurant(
//        id: 4,
//        name: "Test Restaurant 4",
//        deliveryFee: 1.5,
//        deliveryTimeMin: 30,
//        rating: 4.2,
//        imageName: "kfc"
//    )
//    static let sampleRestaurant5 = Restaurant(
//        id: 5,
//        name: "Test Restaurant 5",
//        deliveryFee: 1.5,
//        deliveryTimeMin: 30,
//        rating: 4.2,
//        imageName: "zwz"
//    )
//    
//    static let sampleRestaurants = [sampleRestaurant1, sampleRestaurant2, sampleRestaurant3, sampleRestaurant4, sampleRestaurant5]
//}
