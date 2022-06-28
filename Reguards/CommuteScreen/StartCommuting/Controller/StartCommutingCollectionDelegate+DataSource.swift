//
//  ActionCollectionDelegate+Datasource.swift
//  HomePage
//
//  Created by Ricky on 16/06/22.
//

import Foundation
import UIKit
import CoreLocation
extension StartCommutingController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return actionList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = actionCollectionView.dequeueReusableCell(withReuseIdentifier: "actionCell", for: indexPath)as? StartCommutingCollectionViewCell else{
            fatalError()
        }
        
        cell.dataDisplayed = actionList[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            //untuk ke emergency call
        }else if(indexPath.row == 1){
            //untuk melakukan request guardian
        }
    }
}
