//
//  RestaurantMenu.swift
//  OneFood
//
//  Created by Abdel Rahman Khodr on 02/12/2025.
//

import Foundation
import SwiftUI

struct RestaurantMenu: Hashable, Identifiable, Codable {
    var id: String
    var restaurantInMenu: RestaurantInMenu
    var menu: [Menu]
}

struct RestaurantInMenu: Hashable, Codable {
    var name: String
    var address: String
    var phone: String
    var cuisine: [String]
}

struct Menu: Hashable, Codable {
    var category: String
    var items: [MenuItem]
}

struct MenuItem: Identifiable, Hashable, Codable {
    var id: String
    var name: String
    var description: String
    var price: Float
    var currency: String
    var image: String
}
