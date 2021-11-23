//
//  MoviesLibraryDataService.swift
//  FilmFest
//
//  Created by Shibili Areekara on 19/11/21.
//

import UIKit

enum LibrarySection: Int {
    case moviesToSee, moviesSeen
}

class MoviesLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else { return 0 }
        guard let librarySection = LibrarySection(rawValue: section) else {
            fatalError()
        }
        
        switch librarySection {
        case .moviesToSee:
            return movieManager.moviesToSeeCount
        case .moviesSeen:
            return movieManager.moviesSeenCount
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAt(index: indexPath.row) : movieManager.checkedOffMovieAt(index: indexPath.row)
        
        cell.configureCell(movie: movieData)
        
        return cell
    }

    

}
