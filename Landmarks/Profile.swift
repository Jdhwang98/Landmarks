//
//  Profile.swift
//  Landmarks
//
//  Created by Johnathan Hwang on 7/10/24.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotification = true
    var seasonalPhoto = Season.spring
    
    static let  `default` = Profile(username: "Mike")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring="🌸"
        case summer="☀️"
        case autumn="🍂"
        case winter="❄️"
        
        var id: String {rawValue}
    }
}

