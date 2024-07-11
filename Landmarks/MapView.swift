//
//  MapView.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 6/3/24.
//

import SwiftUI
import MapKit

// Define a struct named MapView that conforms to the View protocol, representing a custom view.
struct MapView: View {
    
    // Declare a variable named coordinate of type CLLocationCoordinate2D, which will be provided when the view is created.
    var coordinate: CLLocationCoordinate2D
    
    //@State used to manage data that can change over time and trigger view update when it changes
    //private means that the region variable can only be accessed within Mapview struct
    //var region declares a variable named region and is inferred to be MKCoordinateRegion because of the initializer after the = sign
    //=MKCoordinateRegion() initializes the region variable and it is a structure from Mapkit framework that defines the center and span of a region, default initializer creates an empty region which we would change later in setRegion
    @State private var region = MKCoordinateRegion()
    
    // Define the main body of the view, which describes the view's content and layout.
    var body: some View {
        
        //Map is provided by the Mapkt framework that displaus a map
        //(coordinateRegion: $region) is the initializer for the map view that takes a binding to MKCoordinateRegion object , the coordinateRegion parameter specifies the region the map should display
        //$region, the $ creates a binding to the region state variable. Binding is 2-way connection that allows a view to read and write the value of a state variable. When the maps region changes like the user moves the map, the state variable will update and it will also update in code if the region state variable is updated in code
        Map(coordinateRegion: $region)
            
            // Add an onAppear modifier to perform an action when the view appears.
            .onAppear {
                
                // Call the setRegion method with the provided coordinate to set the map's region.
                setRegion(coordinate)
            }
    }
    
    // Define a private method named setRegion that takes a coordinate as a parameter and updates the region state variable.
    //the private functin will have one parameter and can only be called from this view
    //the _ before coordinate means that when calling the function, you dont need to provide and argument label, CLLocationCoordinate2D is a structure from corelocationframework representing a geographical coordinate with a latitude and longitude
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        
        // Set the region to be centered around the provided coordinate with a span (zoom level) of 0.2 degrees for both latitude and longitude.
        //region is the state variable of type MKCoordinateLocation that holds the current region displayed by the map
        // after the = creates a new instance of MKCoordinateRegion:
        //center: coordinate,  the center of the region is set to the provided coordinate
        //the span sets the span (zoom level) of the region to 0.2 degreeesfor both longitude and latitude which determines how much the map is visable
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        //overall, this function takes in a CLLocationCoordinate2D object representing a geographical coordinate (latitude and longitude). It updates the region state variable to a new MKCoordinateRegion centered on the provided coordinate with a span of 0.2 degrees for both latitude and longitude , this sets the region the map should display centered around the given coordinate with a specific zoom level
    }
}

#Preview {
    
    // Create an instance of MapView with a sample coordinate.
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
