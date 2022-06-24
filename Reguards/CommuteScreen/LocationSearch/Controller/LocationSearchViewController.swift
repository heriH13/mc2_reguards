//
//  ResultViewController.swift
//  Tabbar
//
//  Created by Ricky on 10/06/22.
//

import Foundation
import UIKit
import CoreLocation




class LocationSearchViewController: UIViewController {

  
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var resultsTableView: UITableView!


    let searchBar = UISearchController(searchResultsController: nil)
    private var places: [Place] = []
    
    override func viewDidLoad() {

        super.viewDidLoad()
        view.createBorder()
        navigationItem.searchController = searchBar
        searchBar.searchResultsUpdater = self
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        resultsTableView.register(UINib(nibName: "LocationSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "locationSearchCell")
        

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultsTableView.frame = view.bounds
    }


    public func update(with Places: [Place]){
        resultsTableView.isHidden = false
        self.places = Places
        resultsTableView.reloadData()
    }


}






