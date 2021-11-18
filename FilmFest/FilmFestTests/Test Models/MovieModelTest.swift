//
//  MovieModelTest.swift
//  FilmFestTests
//
//  Created by Shibili Areekara on 18/11/21.
//

import XCTest
@testable import FilmFest

class MovieModelTest: XCTestCase {

    func test_init_movie_withTitle() {
        let movie = Movie(title: "Prestige")
        
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie.title, "Prestige")
    }
    
    func test_init_movie_withReleaseDate() {
        let movie = Movie(title: "", releaseDate: "1996")
        
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie.releaseDate, "1996")
    }
}
