//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Abe Nkum on 8/24/20.
//  Copyright © 2020 Nkum. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T { //using <T: Codable> to define any type we decide that CONFORMS TO CODABLE
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
//If File can't be found,loaded, or decoded the entire app will crash (fatal error)
//this usually will only happen idf  we forget to load the JSON file into our project
