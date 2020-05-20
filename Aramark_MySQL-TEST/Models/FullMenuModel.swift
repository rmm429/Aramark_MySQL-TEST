//
//  FullMenuModel.swift
//  Aramark_MySQL-TEST
//
//  Created by Ricky Mangerie on 5/19/20.
//  Copyright © 2020 Ricky Mangerie. All rights reserved.
//

import Foundation

/**
* The model where our data will be decoded
* Implements the Decodable protocol in order to meet all the decoding rules
* The variables in the struct need to have exactly the same name and data type that the attributes in the Holiday table from the database have
*/

struct FullMenu: Decodable {
    
    var ID: Int?
    var LocationId: Int?
    var MenuDate: String?
    var MealPeriod: String?
    var StationId: Int?
    var StationName: String?
    var StationSort: Int?
    var SubCatName: String?
    var SubCatSort: Int?
    var ProductId: String?
    var ProductImage: String?
    var ProductName: String?
    var ShortDescription: String?
    var DietaryInfo: String?
    var Serving: String?
    var Calories: Int?
    var CaloriesFromFat: Int?
    var TotalFat: String?
    var SaturatedFat: String?
    var TransFat: String?
    var Cholesterol: String?
    var Sodium: String?
    var TotalCarbs: String?
    var DietaryFiber: String?
    var Sugars: String?
    var Protein: String?
    var Ingredients: String?
    var error: String?
    var HideFromDigitalSignage: Int?
    var ProductSort: Int?
    var Price: Float?
    var IsVegan: Int?
    var IsVegetarian: Int?
    var IsKosher: Int?
    var IsHalal: Int?
    var IsGlutenFree: Int?
    var ContainsShellfish: Int?
    var ContainsPeanuts: Int?
    var ContainsTreeNuts: Int?
    var ContainsMilk: Int?
    var ContainsWheat: Int?
    var ContainsSoy: Int?
    var ContainsEggs: Int?
    var ContainsFish: Int?
    var IsDeemphasized: Int?
    var Allergens: String?
    
}

/**
 * Instantiates a weal delegate property from the Downloadable protocol and a NetworkModel object (the API)
 * Will make the data available and ready to be handled for all the ViewControllers implementing the Downloadable protocol
 */
class FullMenuModel {
    
    weak var delegate: Downloadable?    // Set to Optional because nil responses from the server need to be taken care of
    let networkModel = Network()
    
    /**
     * Creates a URLSession request and then passes that request to the response method from the Network API object
     */
    func downloadFullMenu(url: String) {
        
        let request = networkModel.request(url: url)
        networkModel.response(request: request) { (data) in
            
//            // Convert to a string and print
//            if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
//               print(JSONString)
//            }
            
            // The response is parsed and decoded into the Holiday model
            let model = try! JSONDecoder().decode([FullMenu]?.self, from: data) as [FullMenu]?

            // Protocol delegation to invoke the didReceiveData() method from the Downloadable protocol
            self.delegate?.didReceiveData(data: model! as [FullMenu])
            
        }
        
    }
}
