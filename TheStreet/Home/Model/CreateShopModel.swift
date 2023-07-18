//
//  CreateShopModel.swift
//  TheStreet
//
//  Created by Ashraful Islam Rupu on 7/18/23.
//

import Foundation

// MARK: - CreateShopModel
struct CreateShopModel: Codable {
    let closingDays, subcategories: [String]?
    let id, name: String?
    let coverImageURL, shopImageURL: String?
    let category: String?
    let location: Location?
    let manualAddress, totalCatalouges, totalMembers, averageRating: String?
    let owner: String?
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude: Double?
}
