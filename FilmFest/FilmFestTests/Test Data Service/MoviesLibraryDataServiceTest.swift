//
//  MoviesLibraryDataServiceTest.swift
//  FilmFestTests
//
//  Created by Shibili Areekara on 19/11/21.
//

import XCTest
@testable import FilmFest

class MoviesLibraryDataServiceTest: XCTestCase {
    
    var sut: MoviesLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    var tableViewMock: TableViewMock!
    
    let prestige = Movie(title: "Prestige")
    let inception = Movie(title: "Inception")
    let interstellar = Movie(title: "Interstellar")
    
    override func setUp() {
        super.setUp()
        
        sut = MoviesLibraryDataService()
        sut.movieManager = MovieManager()
        
        libraryVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewController") as? LibraryViewController
        _ = libraryVC.view
        
        tableViewMock = TableViewMock.initMock(dataService: sut)
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }
    
    func test_numberOfSections_returnsTwo() {
        XCTAssertEqual(libraryTableView.numberOfSections, 2)
    }
    
    func test_numberOfRowsInSectionOne_returnMoviesToSeeCount() {
        sut.movieManager?.add(movie: prestige)
        sut.movieManager?.add(movie: inception)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.add(movie: interstellar)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func test_numberOfRowsInSectionTwo_returnsMoviesSeenCount() {
        sut.movieManager?.add(movie: prestige)
        sut.movieManager?.add(movie: inception)
        sut.movieManager?.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.checkOffMovieAt(index: 0)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
        
    }
    
    
    func test_cellForRowAt_returnsMovieCell() {
        sut.movieManager?.add(movie: prestige)
        libraryTableView.reloadData()
        
        let cell = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is MovieCell)
    }
    
    func test_tableView_shouldDequeueCell() {
        sut.movieManager?.add(movie: prestige)
        tableViewMock.reloadData()
        
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func test_sectionOne_shouldSetCellData() {
        sut.movieManager?.add(movie: prestige)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, prestige)
    }
    
    func test_sectionTwo_shouldSetCellData() {
        sut.movieManager?.add(movie: prestige)
        sut.movieManager?.add(movie: inception)
        sut.movieManager?.checkOffMovieAt(index: 0)
        tableViewMock.reloadData()

        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, prestige)
        
    }
}





