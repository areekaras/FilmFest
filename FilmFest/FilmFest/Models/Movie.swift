//
//  Movie.swift
//  FilmFest
//
//  Created by Shibili Areekara on 18/11/21.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
