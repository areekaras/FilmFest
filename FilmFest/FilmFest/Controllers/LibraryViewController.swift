//
//  ViewController.swift
//  FilmFest
//
//  Created by Shibili Areekara on 18/11/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MoviesLibraryDataService!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
    }


}

