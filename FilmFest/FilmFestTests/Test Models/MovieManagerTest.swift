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
    func test_addMovie_returnOneMoviesToSeeCount() {
        sut.add(movie: prestigeMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func test_addOneMovie_addedMovieTitleEqualsFirstMovieTitle() {
        sut.add(movie: prestigeMovie)
        
        let firstMovie = sut.movieAt(index: 0)
        
        XCTAssertEqual(prestigeMovie.title, firstMovie.title)
    }
    
    func test_addTwoMovies_secondAddedMovieTitleEqualsSecondMovieTitle() {
        sut.add(movie: prestigeMovie)
        sut.add(movie: inceptionMovie)
        
        let secondMovie = sut.movieAt(index: 1)
        
        XCTAssertEqual(inceptionMovie.title, secondMovie.title)
    }
    
    
    //MARK:- CheckOff
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
    
    func test_checkedOffMovieAtIndex_returnMovieAtIndex() {
        sut.add(movie: prestigeMovie)
        sut.checkOffMovieAt(index: 0)
        
        let checkedOffMovie = sut.checkedOffMovieAt(index: 0)
        
        XCTAssertEqual(checkedOffMovie.title, prestigeMovie.title)
    }
}
