//
//  LocationSearchViewResultUpdating.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
extension LocationSearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        backgroundView.backgroundColor = UIColor(hex: "080D26")
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty
        else{


            return
        }
        
        GooglePlacesManager.shared.findPlaces(query: query){
            result in switch result {
                case .success(let places):


                    DispatchQueue.main.async {
                        self.update(with: places)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
