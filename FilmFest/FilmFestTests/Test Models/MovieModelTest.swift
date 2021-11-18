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
        let sut = Movie(title: "Prestige")
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.title, "Prestige")
    }
    
    func test_init_movie_withReleaseDate() {
        let sut = Movie(title: "Prestige", releaseDate: "1996")
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.releaseDate, "1996")
    }
}
