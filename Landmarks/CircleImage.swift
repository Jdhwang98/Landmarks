//
//  CircleImage.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 6/3/24.
//

import SwiftUI
//make a variable for the image to make it dynamic and not a hard coded image
struct CircleImage: View {
    
    // Declare a variable named image of type Image, which will be provided when the view is created.
    var image: Image
    
    // Define the main body of the view, which describes the view's content and layout.
    var body: some View {
        
        // Use the provided image and apply various modifiers to it.
        image
            // Clip the image into a circular shape.
            .clipShape(Circle())
            
            // Overlay the image with a circular border (stroke).
            .overlay {
                // Create a Circle shape with a gray stroke of 4 points in width.
                Circle().stroke(.gray, lineWidth: 4)
            }
            
            // Apply a shadow with a radius of 7 points to the image.
            .shadow(radius: 7)
    }
}

// Define a preview provider for CircleImage, used to display a preview of the view in Xcode.
#Preview {
    
    // Create an instance of CircleImage with a sample image named "turtlerock".
    CircleImage(image: Image("turtlerock"))
}
