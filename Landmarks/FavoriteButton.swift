//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 6/26/24.
//

import SwiftUI

// Define a struct named FavoriteButton that conforms to the View protocol
struct FavoriteButton: View {
    // Declare a binding variable to keep track of the state, which is shared with another view
    @Binding var isSet: Bool
    
    // Define the body property which describes the view's content and layout
    var body: some View {
        // Create a button that toggles the isSet state when pressed
        Button {
            isSet.toggle() // Toggle the value of isSet between true and false
        } label: {
            // Define the label of the button using a Label view
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                // Use only the icon from the Label
                .labelStyle(.iconOnly)
                // Set the foreground color to yellow if isSet is true, otherwise set it to gray
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

// Define a preview provider for the FavoriteButton view
#Preview {
    // Create an instance of FavoriteButton with a constant binding set to true
    FavoriteButton(isSet: .constant(true))
}
