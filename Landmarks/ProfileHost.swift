//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 7/10/24.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    var body: some View {
        Text("Profile for: \(draftProfile.username)")
    }
}

#Preview {
    ProfileHost()
}
