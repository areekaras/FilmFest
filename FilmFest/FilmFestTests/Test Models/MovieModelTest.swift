//
//  MovieModelTest.swift
//  FilmFestTests
//
//  Created by Shibili Areekara on 18/11/21.
//

import XCTest
@testable import FilmFest

class MovieModelTest: XCTestCase {

    func test_init_withTitle() {
        let sut = Movie(title: "Prestige")
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.title, "Prestige")
    }
    
    func test_init_withReleaseDate() {
        let sut = Movie(title: "Prestige", releaseDate: "1996")
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.releaseDate, "1996")
    }
    
    //MARK:- Equatable
    func test_equalWithSameTitle() {
        let sut1 = Movie(title: "Inception")
        let sut2 = Movie(title: "Inception")
        
        XCTAssertEqual(sut1, sut2)
    }
    
    func test_notEqualWithDifferentTitle() {
        let sut1 = Movie(title: "Inception")
        let sut2 = Movie(title: "Prestige")
        
        XCTAssertNotEqual(sut1, sut2)
    }
    
    func test_notEqualWithDifferentReleaseDate() {
        let sut1 = Movie(title: "Inception", releaseDate: "1996")
        let sut2 = Movie(title: "Inception", releaseDate: "1997")
        
        XCTAssertNotEqual(sut1, sut2)
    }
}
