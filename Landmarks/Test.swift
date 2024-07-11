//
//  Test.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 6/5/24.
//

import SwiftUI

struct Test: View {
    //Landmark is a structure (class) we defines
    var landmark: Landmark
    var body: some View {
        Text(landmark.name)
    }
}

#Preview {
    Test(landmark: ModelData().landmarks[0])
}
