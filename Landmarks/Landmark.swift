//
//  Landmark.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 6/5/24.
//

import Foundation
import SwiftUI
import CoreLocation

//hashable = searchable by id, searching
//Codable = read file by the code/id

//Hashable: Allows objects to be stored in sets and used as dictionary keys by providing unique hash value
//Codeable: Allows for easy encoding and decoding of objects to and from formats like JSON
//Identifiable: Provides a unique identifier for objects, making it easier to manage and update
struct Landmark: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool 
    
    var category: Category
    //CaseIterable: goes through elements 1 by 1, like a loop
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    
    private var imageName: String
    // Define a computed property named image of type Image, which creates an Image from imageName.
    var image: Image {
        Image(imageName)
    }
    
    // Define a nested struct named Coordinates that conforms to Hashable and Codable protocols.
    struct Coordinates: Hashable, Codable {
            var latitude: Double
            var longitude: Double
    }
    
    // Define a private property named coordinates of type Coordinates, representing the landmark's geographical coordinates.
    private var coordinates: Coordinates
    
    // Define a computed property named locationCoordinate of type CLLocationCoordinate2D, which converts Coordinates to CLLocationCoordinate2D.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}
