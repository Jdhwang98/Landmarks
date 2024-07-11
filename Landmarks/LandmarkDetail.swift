//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 6/12/24.
//

import SwiftUI
import MapKit

// Defining a structure named LandmarkDetail that conforms to the View protocol
struct LandmarkDetail: View {
    //@EnvironmentObject is used to share data across multiple views in an app and it shares data between different views and updates those views when data changes
    //modelData is an environment object, type ModelData, modelData is shared across views, changes to modelData will update any view that depends on it, useful for data that needs to be modified by multiple views(shared data model)
    @EnvironmentObject var modelData: ModelData
    // Defining a variable to hold a specific landmark
    //using the landmark variable we can call different parts of the landmark to retrieve the name, image, etc.
    var landmark: Landmark
    
    // A computed property to get the index of the current landmark in the modelData's landmarks array
    //the value is calculated every time it is accessed
    //modelData accesses the modelData property which is an environment object containing shared data, accessing the landmarks array in modelData
    //firstIndex(where:) method is called on landmarks array, this returns the index of the first element that satisfies the given predicate
    //the predicate is inside the closure, { $0.id == landmarks.id} and it compares the id of each landmark in the landmarks array to the id of the landmark instance associated in the view, $0 represents eachlandmark in the array during the search
    //the "!" at the end force unwraps the optional value, meaning it assues forstIndex(where:) will always find a matching element and return a valid index, if no matching element is found it will crash the program
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    // The body property, which defines the view's layout and behavior
    var body: some View {
        // Using ScrollView to enable scrolling of the content
        ScrollView {
            // Displaying a map with the coordinate of the landmark
            MapView(coordinate: landmark.locationCoordinate)
                // Ignoring the safe area at the top to let the map extend to the top edge
                .ignoresSafeArea(edges: .top)
                // Setting the height of the map
                .frame(height: 300)

            // Displaying landmark image in a circular frame from view we created
            CircleImage(image: landmark.image)
                // Moving the image up by 130 points
                .offset(y: -130)
                // Adding bottom padding of -130 points to counter the offset
                .padding(.bottom, -130)
            
            // Using a VStack to arrange views vertically
            VStack(alignment: .leading) {
                // Using an HStack to arrange views horizontally
                HStack {
                    // Displaying the landmark's name with a title font
                    Text(landmark.name)
                        // Applying the title font
                        .font(.title)
                    // Displaying a favorite button that toggles the favorite status of the landmark
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                // Another HStack to display the park and state of the landmark
                HStack {
                    // Displaying the name of the park
                    Text(landmark.park)
                    // Adding a flexible space to push the next text to the right
                    Spacer()
                    // Displaying the name of the state
                    Text(landmark.state)
                }
                // Applying a subheadline font and secondary color to the text
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                // Adding a divider to separate sections
                Divider()
                
                // Displaying a title for the description section
                Text("About \(landmark.name)")
                    // Applying the title2 font
                    .font(.title2)
                // Displaying the description of the landmark
                Text(landmark.description)
            }
            // Adding padding around the VStack
            .padding()
            
            // Adding a spacer to push the content to the top
            Spacer()
        }
        // Setting the navigation title to the landmark's name
        .navigationTitle(landmark.name)
        // Displaying the navigation title inline
        .navigationBarTitleDisplayMode(.inline)
    }
}

// A preview provider for the LandmarkDetail view, showing a preview in the canvas
#Preview {
    // Creating a LandmarkDetail view with a sample landmark for preview purposes
    LandmarkDetail(landmark: ModelData().landmarks[3])
        .environmentObject(ModelData())
}
