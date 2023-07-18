//
//  SubCategories.swift
//  TheStreet
//
//  Created by Ashraful Islam Rupu on 7/18/23.
//

import Foundation

// MARK: - SubCategories
struct SubCategories: Codable {
    let success: Bool?
    let message: String?
    let statusCode: Int?
    let data: Category?
}
