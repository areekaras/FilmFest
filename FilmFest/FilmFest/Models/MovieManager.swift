//
//  MovieManager.swift
//  FilmFest
//
//  Created by Shibili Areekara on 18/11/21.
//

import Foundation

class MovieManager {
    private var moviesToSee = [Movie]()
    private var moviesSeen = [Movie]()
    
    var moviesToSeeCount: Int {
        return moviesToSee.count
    }
    var moviesSeenCount: Int {
        return moviesSeen.count
    }
    
    
    //MARK:- Add and Query
    func add(movie: Movie) {
        if !moviesToSee.contains(movie) {
            moviesToSee.append(movie)
        }
    }
    
    func movieAt(index: Int) -> Movie {
        return moviesToSee[index]
    }
    
    //MARK:- Check off
    func checkOffMovieAt(index: Int) {
        guard index < moviesToSeeCount else { return }
        
        let checkedOffMovie = moviesToSee.remove(at: index)
        moviesSeen.append(checkedOffMovie)
    }
    
    func checkedOffMovieAt(index: Int) -> Movie {
        return moviesSeen[index]
    }
    
    func clearMovies() {
        moviesToSee.removeAll()
        moviesSeen.removeAll()
    }
}

