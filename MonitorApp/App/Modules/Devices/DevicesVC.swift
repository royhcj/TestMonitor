//
//  DevicesVC.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/11.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class DevicesVC: UIViewController,
                 UITableViewDataSource,
                 UITableViewDelegate {

    var devices: [Device] = []
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Object lifecycle
    static func make(devices: [Device]?) -> DevicesVC {
        let vc = UIStoryboard(name: "Devices", bundle: nil)
                    .instantiateViewController(withIdentifier: "DevicesVC")
                    as! DevicesVC
        if let devices = devices {
            vc.devices = devices
        }
        return vc
    }
    
    // MARK: = View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register table cells
        tableView.register(UINib(nibName: "CommonMonitorCell", bundle: nil),
                           forCellReuseIdentifier: CommonMonitorCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshDevices()
    }
    
    // MARK: - Table DataSource/Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommonMonitorCell.identifier, for: indexPath)
        let device = devices[indexPath.row]
        
        if let cell = cell as? Cell {
            cell.titleLabel.text = device.name
        }
        
        return cell
    }
    
    // MARK: - Refresh Methods
    func refreshDevices() {
        tableView.reloadData()
    }
    
    // MARK: - Type Definitions
    typealias Cell = CommonMonitorCell


}
