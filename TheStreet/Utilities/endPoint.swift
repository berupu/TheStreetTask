//
//  endPoint.swift
//  TheStreet
//
//  Created by Ashraful Islam Rupu on 7/18/23.
//

import Foundation

enum APIEndPoints: String {
    
    case rootURL = "http://development.thelocalstreet.com/api/v1/"
    case getCategory = "shop/category?limit=30&page=1&search="
    case getSubCategory = "shop/subcategory/"
    case createShop = "shop"
    
    
    case AccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGFmOTVhYTdhMGQ0NDE3MzBjNTMzNmMiLCJmaXJzdE5hbWUiOiJBbmlsIiwibGFzdE5hbWUiOiJLdW1hciIsIm1vYmlsZSI6Ijk4MjAxOTgyMDEiLCJwcm9maWxlSW1hZ2UiOiJodHRwczovL3BpY3N1bS5waG90b3MvMjAwLzMwMCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg5MjQ1NTgzfQ.1MrzbJLXRpY-ZtlIMVi2DBlUeE9xbssX6ILFQuVOSKw"
    
}
