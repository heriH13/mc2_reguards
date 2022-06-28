//
//  SettingViewContoller.swift
//  Reguards
//
//  Created by Ricky on 25/06/22.
//

import Foundation

import UIKit

class SettingViewController: UIViewController{
    @IBOutlet weak var settingTableView: UITableView!
    var settingData = Setting()
    override func viewDidLoad() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "settingCell")
        super.viewDidLoad()
    }
}
