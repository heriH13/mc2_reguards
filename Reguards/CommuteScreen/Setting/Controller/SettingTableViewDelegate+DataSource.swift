//
//  SettingTableViewDelegate+DataSource.swift
//  Reguards
//
//  Created by Ricky on 25/06/22.
//

import Foundation

import UIKit

extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingData.settingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else{
            fatalError()
        }
        
        cell.dataDisplayed = settingData.settingList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 1){
            
//            buat keluar dan inisiali bahwa user sudah tidak terdapat login
        }
    }
    
    
}
