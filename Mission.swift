//
//  Mission.swift
//  MoonShot
//
//  Created by Abe Nkum on 8/24/20.
//  Copyright © 2020 Nkum. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable { //CrewRole must be its own struct since had more than 1 member
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String{
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
            
        }else{
            return "N/A"
        }
    }
}
