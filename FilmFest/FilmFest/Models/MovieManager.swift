//
//  MovieManager.swift
//  FilmFest
//
//  Created by Shibili Areekara on 18/11/21.
//

import Foundation

class MovieManager {
    var moviesToSeeCount = 0
    var moviesSeenCount = 0
    
    private var moviesToSee = [Movie]()
    
    func add(movie: Movie) {
        moviesToSeeCount += 1
        
        moviesToSee.append(movie)
    }
    
    func movieAt(index: Int) -> Movie {
        return moviesToSee[index]
    }
    
    func checkOffMovieAt(index: Int) {
        guard index < moviesToSeeCount else { return }
        
        moviesToSeeCount -= 1
        moviesSeenCount += 1
        
        moviesToSee.remove(at: index)
    }
}
