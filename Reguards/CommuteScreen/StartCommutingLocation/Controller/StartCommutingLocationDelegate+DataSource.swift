//
//  StartCommutingLocationDelegate+DataSource.swift
//  Reguards
//
//  Created by Ricky on 24/06/22.
//

import Foundation

extension StartCommutingLocationController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transportList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = transportationCollectionView.dequeueReusableCell(withReuseIdentifier: "transportCell", for: indexPath) as? TransportationCollectionViewCell else{
            fatalError()
        }
        cell.transportation.tag = indexPath.row
        cell.dataDisplayed = transportList[indexPath.row]
        return cell
    }
    
    
    
    
}
