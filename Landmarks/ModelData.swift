//
//  ModelData.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 6/5/24.
//

import Foundation

final class ModelData: ObservableObject {
    // @Published property wrapper to notify views of changes to landmarks
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    //$0 is an element in the Landmark array
    var categories: [String: [Landmark]]{
        Dictionary(grouping: landmarks, by: { $0.category.rawValue})
    }
    
}

//load reads the data from the json file and puts it inside of landmarks
//"_" means you dont have to specify the parameter name when calling the function
func load<T: Decodable>(_ filename: String) -> T {
    // Declare a variable to hold the file data
    let data: Data
    //like a try catch, read the file and if the file DNE print error message
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Can't Open File")
    }
    
    do {
        //get the file and read the data
        // Try to read the contents of the file into the data variable
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Can't Read File")
    }
    
    do {
        // Create a JSON decoder to decode the data
        //convert data into something we can recognize (T)
        let decoder = JSONDecoder()
        // Try to decode the data into an object of type T and return it
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Data wrong")
    }
}
