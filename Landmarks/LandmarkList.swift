//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 6/12/24.
//

import SwiftUI

struct LandmarkList: View {
    
    //@EnvironmentObject is used to share data across multiple views in an app and it shares data between different views and updates those views when data changes
    //modelData is an environment object, type ModelData, modelData is shared across views, changes to modelData will update any view that depends on it, useful for data that needs to be modified by multiple views(shared data model)
    @EnvironmentObject var modelData: ModelData
    
    // Create a state variable to control if we only show favorite landmarks
    //@State is used to create a state variable that SwiftUI manages, when the state variable changes, the view updates to reflect those changes.
    //We declare the state variable and initialize it to false, this variable is prrivate to the voew and controlls whether only favorite landmarks should be shown.
    //the swiftUI monitors this variable for changes, when the value changes (like when the user toggles the favorites only switch, the swiftUI re-renders the view and reflects the new state
    @State private var showFavoritesOnly = false
    
    // Filter the landmarks based on the showFavoritesOnly state
    var filteredLandmarks: [Landmark] {
        // If showFavoritesOnly is true, only include favorite landmarks
        //modelData.landmarks = accesses list of landmarks from modelData
        //.filter creates a new array containing the landmarks that meet the criteria
        //the criteria is defined in the closure { landmark in .....}
        //showFavoritesOnly is a boolean variable indicating whether we show favorites
        //landmark.isFavorite, property of landmarks indicating  landmark is favorite
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            //if showFavoritesOnly is false, !showFavoritesOnly will be true showFavoritesOnly = false, all landmarks will pass the filter condition because the condition will always be true, (true || true)
            
            //if showFavoritesOnly is true, !showFavoritesOnly is false so the condition relies on landmark.isFavorite when showFavoritesOnly is true, only landmarks that are favorites, (isFavorite in json file is true) will pass the filter condition
        }
    }

    // Define what the view looks like
    var body: some View {
        NavigationView {
            List {
                // Add a toggle switch to filter for favorite landmarks
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                // Loop through the filtered landmarks and create a row for each one
                ForEach(filteredLandmarks) { landmark in
                    // Make each row a link to a detailed view of the landmark
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        // Show the landmark's details in a row
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            // Set the title at the top of the navigation view
            .navigationTitle("Landmarks")
        }
    }
}

// Code to preview the LandmarkList view
#Preview {
    LandmarkList()
        // Provide the shared data for the preview
        .environmentObject(ModelData())
}
