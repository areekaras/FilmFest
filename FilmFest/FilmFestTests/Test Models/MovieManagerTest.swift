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
    
    let prestigeMovie = Movie(title: "Prestige")
    let inceptionMovie = Movie(title: "Inception")
    
    override func setUp() {
        super.setUp()
        
        sut = MovieManager()
    }
    
    //MARK:- Initialize
    func test_init_returnsZeroMoviesToSeeCountAndZeroMoviesSeenCount() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK:- Add and Query
    
    func test_addMovies_returnsMovie() {
        sut.add(movie: prestigeMovie)
        sut.add(movie: inceptionMovie)
        
        let secondMovie = sut.movieAt(index: 1)
        
        XCTAssertEqual(sut.moviesToSeeCount, 2)
        XCTAssertEqual(inceptionMovie.title, secondMovie.title)
    }
    
    
    //MARK:- Check off
    func test_checkOffAMovie_returnOneMoviesSeenCountAndZeroMoviesToSeeCount() {
        sut.add(movie: prestigeMovie)
        
        sut.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func test_checkOffMovie_removesMovieFromMoviestoSeeArray() {
        sut.add(movie: prestigeMovie)
        sut.add(movie: inceptionMovie)
        
        sut.checkOffMovieAt(index: 0)
        let firstMovie = sut.movieAt(index: 0)
        
        XCTAssertEqual(firstMovie.title, inceptionMovie.title)
    }
    
    func test_checkOffMovie_returnCheckedOffMovieAtIndex() {
        sut.add(movie: prestigeMovie)
        sut.checkOffMovieAt(index: 0)
        
        let checkedOffMovie = sut.checkedOffMovieAt(index: 0)
        
        XCTAssertEqual(checkedOffMovie.title, prestigeMovie.title)
    }
    
    func test_clearMovies_returnZeroMovieCounts() {
        sut.add(movie: prestigeMovie)
        sut.add(movie: inceptionMovie)
        sut.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearMovies()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    func test_preventsDuplicateEntry() {
        sut.add(movie: prestigeMovie)
        sut.add(movie: prestigeMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
