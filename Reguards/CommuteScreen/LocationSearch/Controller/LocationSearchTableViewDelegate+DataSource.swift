//
//  LocationSearchViewDelegate+DataSource.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation
extension LocationSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "locationSearchCell", for: indexPath)as? LocationSearchTableViewCell else{
            fatalError()
        }
        cell.dataDisplayed = places[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        tableView.isHidden = true
        let place = places[indexPath.row]
        
        searchBar.searchBar.resignFirstResponder()
        GooglePlacesManager.shared.resolveLocation(for: place) {[weak self] result in
            switch result{
            case .success(let coordinate):
                
                self?.dismiss(animated: true){
                    let data = ["data" : ["coordinate" :coordinate, "name" :place]]
                    NotificationCenter.default
                                .post(name: NSNotification.Name("com.user.receive.Coordinate"),
                                 object: nil,
                                 userInfo: data)
                }
                    
                

            case .failure(let error):
                print(error)
            }
        }
    }

}
