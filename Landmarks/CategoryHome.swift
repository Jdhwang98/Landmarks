//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 7/1/24.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        NavigationView {
            List {
                modelData.features[2].image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                //keys are the 3 types (mountains, rivers, lakes)
                ForEach(modelData.categories.keys.sorted(), 
                        id: \.self){ key in
                    CategoryRow(categoryName: key, items:
                                    modelData.categories[key]!)
                }
                        .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

#Preview {
    CategoryHome()
        .environmentObject(ModelData())
}
