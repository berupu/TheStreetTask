//
//  CreateShopModelResponse.swift
//  TheStreet
//
//  Created by Ashraful Islam Rupu on 7/18/23.
//

import Foundation


// MARK: - CreateShopModelResponse
struct CreateShopModelResponse: Codable {
    let success: Bool?
    let message: String?
    let statusCode: Int?
    let data: CreateShopDataClass?
}

// MARK: - DataClass
struct CreateShopDataClass: Codable {
    let closingDays, subcategories: [String]?
    let _id, name: String?
    let coverImageURL, shopImageURL: String?
    let category: String?
    let location: CreateShopLocation?
    let manualAddress, totalCatalouges, totalMembers, averageRating: String?
    let owner: String?
}

// MARK: - Location
struct CreateShopLocation: Codable {
    let latitude, longitude: Double?
}
