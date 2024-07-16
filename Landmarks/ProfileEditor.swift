//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 7/15/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            Toggle(isOn: $profile.prefersNotification) {
                Text("Enable Notification").bold()
            }
            VStack(alignment: .leading, spacing: 20) {
                            Text("Seasonal Photo").bold()
                            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                                ForEach(Profile.Season.allCases) { season in
                                    Text(season.rawValue).tag(season)

                                }
                            }
                            .pickerStyle(.segmented)

                        }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}

//
//VStack(alignment: .leading, spacing: 20) {
//                Text("Seasonal Photo").bold()
//                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
//                    ForEach(Profile.Season.allCases) { season in
//                        Text(season.rawValue).tag(season)
//
//                    }
//                }
//                .pickerStyle(.segmented)
//
//            }
