//
//  LibraryViewControllerTest.swift
//  FilmFestTests
//
//  Created by Shibili Areekara on 19/11/21.
//

import XCTest
@testable import FilmFest

class LibraryViewControllerTest: XCTestCase {
    
    var sut: LibraryViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewController") as? LibraryViewController
        
        _ = sut.view
    }
    
    func testLibraryVC_viewDidLoad_tableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    func testLibraryVC_viewDidLoad_setsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MoviesLibraryDataService)
    }
    
    func testLibraryVC_viewDidLoad_setsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MoviesLibraryDataService)
    }
    
    func testLibraryVC_viewDidLoad_singleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as! MoviesLibraryDataService, sut.libraryTableView.delegate as! MoviesLibraryDataService)
    }
    
}
