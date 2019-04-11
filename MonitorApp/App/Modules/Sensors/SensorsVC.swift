//
//  SensorsVC.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/11.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class SensorsVC: UIViewController,
                 UITableViewDataSource,
                 UITableViewDelegate {
    
    var sensors: [Sensor] = []

    @IBOutlet var tableView: UITableView!
    
    
    // MARK: - Object lifecycle
    static func make(sensors: [Sensor]?) -> SensorsVC {
        let vc = UIStoryboard(name: "Sensors", bundle: nil)
                    .instantiateViewController(withIdentifier: "SensorsVC")
                    as! SensorsVC
        if let sensors = sensors {
            vc.sensors = sensors
        }
        return vc
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register table cells
        tableView.register(UINib(nibName: "CommonMonitorCell", bundle: nil),
                           forCellReuseIdentifier: CommonMonitorCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshSensors()
    }
    
    // MARK: - Table DataSource/Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sensors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommonMonitorCell.identifier, for: indexPath)
        let sensor = sensors[indexPath.row]
        
        if let cell = cell as? Cell {
            cell.titleLabel.text = sensor.name
        }
        
        return cell
    }
    
    // MARK: - Refresh Methods
    func refreshSensors() {
        tableView.reloadData()
    }
    
    // MARK: - Type Definitions
    typealias Cell = CommonMonitorCell

}
