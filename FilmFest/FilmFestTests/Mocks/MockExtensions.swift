//
//  MockExtensions.swift
//  FilmFestTests
//
//  Created by Shibili Areekara on 19/11/21.
//

import XCTest
@testable import FilmFest

extension MoviesLibraryDataServiceTest {
    
    
    
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        class func initMock(dataService: MoviesLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataService
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "MovieCell")
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell {
        var movieData: Movie?
        
        override func configureCell(movie: Movie) {
            self.movieData = movie
        }
    }
}

