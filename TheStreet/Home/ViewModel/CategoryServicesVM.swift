//
//  CategoryServicesVM.swift
//  TheStreet
//
//  Created by Ashraful Islam Rupu on 7/18/23.
//

import Foundation

class CategoryServicesVM:ObservableObject {
    
    
    @Published var responseStatus: Categories?
    @Published var responseStatus2: SubCategories?
    
    
    
    func getCategories() {
        guard let url = URL(string: APIEndPoints.rootURL.rawValue + APIEndPoints.getCategory.rawValue) else {
            return
        }
        let token = APIEndPoints.AccessToken.rawValue
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response,error in
            guard let data = data else {return}
            do {
                let dataModel = try JSONDecoder().decode(Categories.self, from: data)
                print(dataModel)
                DispatchQueue.main.async {
                    self.responseStatus = dataModel
                    print("categories \(dataModel)")
                }
            } catch let error {
                print(error)
            }
        }
        .resume()
        
    }
    
    func getuSubCategories(categoryId: String) {
        guard let url = URL(string: APIEndPoints.rootURL.rawValue + APIEndPoints.getSubCategory.rawValue + "\(categoryId)?limit=30&page=1&search=") else {
            return
        }
        
        let token = APIEndPoints.AccessToken.rawValue
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response,error in
            guard let data = data else {return}
            do {
                let dataModel = try JSONDecoder().decode(SubCategories.self, from: data)
                print(dataModel)
                DispatchQueue.main.async {
                    self.responseStatus2 = dataModel
                    print("Sub \(self.responseStatus2)")
                }
            } catch let error {
                print(error)
            }
        }
        .resume()
        
    }
    
    func createShop1(){
        let url = URL(string: APIEndPoints.rootURL.rawValue + APIEndPoints.createShop.rawValue)
        guard let requestUrl = url else { fatalError() }
        
        let token = APIEndPoints.AccessToken.rawValue
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let createShop = CreateShopModel(closingDays: ["Sunday"], subcategories: ["646f7dea4c311b255d0e2d78"], id: "64afdaf28d7a45614b692609", name: "My First shop", coverImageURL:  "https://picsum.photos/200/300", shopImageURL:  "https://picsum.photos/200/300", category: "646f1971aea28286de7bbf7d", location: Location(latitude: 22.7196, longitude: 75.8577), manualAddress:  "700,MR-3,Mahalaxmi nagar", totalCatalouges: "0", totalMembers: "0", averageRating: "0", owner: "64af95aa7a0d441730c5336c")
  
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: createShop, options: []) else {
            return
        }
        request.httpBody = httpBody
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    func createShop() {
        guard let url = URL(string: APIEndPoints.rootURL.rawValue + APIEndPoints.createShop.rawValue) else {
            return
        }
        let token = APIEndPoints.AccessToken.rawValue
        
        let parameters: [String: Any] = [
            "closingDays": ["sunday"],
            "subcategories": ["646f7dea4c311b255d0e2d78"],
            "id": "64afdaf28d7a45614b692609",
            "name": "My First shop",
            "coverImageUrl": "https://picsum.photos/200/300",
            "shopImageUrl": "https://picsum.photos/200/300",
            "category": "646f1971aea28286de7bbf7d",
            "location": [
                "latitude": 22.7196,
                "longitude": 75.8577
            ],
            "manualAddress": "700, MR-3, Mahalaxmi nagar",
            "totalCatalouges": "0",
            "totalMembers": "0",
            "averageRating": "0",
            "owner": "64af95aa7a0d441730c5336c"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(token)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch let error {
            print("Error serializing parameters: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if response.statusCode == 200 {
                // Request successful, handle the response data as needed
                if let responseData = String(data: data, encoding: .utf8) {
                    print("Response Data: \(responseData)")
                }
            } else {
                print("Error: Unexpected status code \(response.statusCode)")
            }
        }.resume()
    }
    
    
}


