//
//  Movie.swift
//  Assessment3
//
//  Created by Leah Cluff on 6/28/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation

class Movie: Codable {
    
    let title: String
    let overview: String
    let imageURL: URL
    let rating: String
    
    init(title: String, overview: String, imageURL: URL, rating: String) {
        
        enum CodingKeys: String, CodingKey {
            case rating = "vote_average"
            case overview = "overview"
            case title = "title"
        }
        
        self.title = title
        self.overview = overview
        self.imageURL = imageURL
        self.rating = rating
    }
}



