//
//  MovieManagerTest.swift
//  FilmFestTests
//
//  Created by Shibili Areekara on 18/11/21.
//

import XCTest
@testable import FilmFest

class MovieManagerTest: XCTestCase {

    var sut: MovieManager!
    
    override func setUp() {
        super.setUp()
        
        sut = MovieManager()
    }
    
    //MARK:- Initialization tests
    func test_init_returnsZeroMoviesToSeeCountAndZeroMoviesSeenCount() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK:- Add and Query
    func test_addMovie_returnOneMoviesToSeeCount() {
        let prestigeMovie = Movie(title: "Prestige")
        sut.add(movie: prestigeMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func test_addOneMovie_addedMovieTitleEqualsFirstMovieTitle() {
        let prestigeMovie = Movie(title: "Prestige")
        sut.add(movie: prestigeMovie)
        
        let firstMovie = sut.movieAt(index: 0)
        
        XCTAssertEqual(prestigeMovie.title, firstMovie.title)
    }
    
    func test_addTwoMovies_secondAddedMovieTitleEqualsSecondMovieTitle() {
        let prestigeMovie = Movie(title: "Prestige")
        let inception = Movie(title: "Inception")
        sut.add(movie: prestigeMovie)
        sut.add(movie: inception)
        
        let secondMovie = sut.movieAt(index: 1)
        
        XCTAssertEqual(inception.title, secondMovie.title)
    }
    
    
    func test_checkOffAMovie_returnOneMoviesSeenCountAndZeroMoviesToSeeCount() {
        let prestigeMovie = Movie(title: "Prestige")
        sut.add(movie: prestigeMovie)
        
        sut.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func test_checkOffMovie_removesMovieFromMoviestoSeeArray() {
        let prestige = Movie(title: "Prestige")
        let inception = Movie(title: "Inception")
        sut.add(movie: prestige)
        sut.add(movie: inception)
        
        sut.checkOffMovieAt(index: 0)
        let firstMovie = sut.movieAt(index: 0)
        
        XCTAssertEqual(firstMovie.title, inception.title)
    }
    
}
