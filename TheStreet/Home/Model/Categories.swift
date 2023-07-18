//
//  Categories.swift
//  TheStreet
//
//  Created by Ashraful Islam Rupu on 7/18/23.
//

import Foundation

// MARK: - Categories
struct Categories:  Codable {
    let success: Bool?
    let message: String?
    let statusCode: Int?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass:  Codable {
    let categories: [Category]?
}

// MARK: - Category
struct Category:  Codable {
//    let subCategories: [Any]?
//    let tags: [String]?
    let _id, name: String?
    let imageURL: String?
}
