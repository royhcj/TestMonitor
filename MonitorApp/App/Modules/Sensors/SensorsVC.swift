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
    
    var ownershipInfo: OwnershipInfo?
    var sensors: [Sensor] = []

    @IBOutlet var tableView: UITableView!
    var sections: [SectionType] = [.info, .sensors]
    
    // MARK: - Object lifecycle
    static func make(sensors: [Sensor]?,
                     ownershipInfo: OwnershipInfo?) -> SensorsVC {
        let vc = UIStoryboard(name: "Sensors", bundle: nil)
                    .instantiateViewController(withIdentifier: "SensorsVC")
                    as! SensorsVC
        if let sensors = sensors {
            vc.sensors = sensors
        }
        vc.ownershipInfo = ownershipInfo
        return vc
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshSensors()
    }
    
    // MARK: - Table DataSource/Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        switch section {
        case .info:     return 1
        case .sensors:  return sensors.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier,
                                                 for: indexPath)
        
        
        if let cell = cell as? InfoCell {
            cell.probeNameLabel.text = ownershipInfo?.ownerProbeName
            cell.organizationNameLabel.text = ownershipInfo?.ownerOrganizationName
            cell.deviceLabel.text = ownershipInfo?.ownerDeviceName
        } else if let cell = cell as? SensorCell {
            let sensor = sensors[indexPath.row]
            
            cell.sensorNameLabel.text = sensor.name
            cell.sensorStatusLabel.text = sensor.statusMessage
            cell.sensorLatestLabel.text = "最新數據: \(sensor.lastValue ?? "")"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard sections[indexPath.section] == .sensors
        else {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        let sensor = sensors[indexPath.row]
        
        let vc = SensorVC.make(sensor: sensor, ownershipInfo: ownershipInfo)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Refresh Methods
    func refreshSensors() {
        tableView.reloadData()
    }
    
    // MARK: - Type Definitions
    typealias Cell = CommonMonitorCell
    
    enum SectionType: Int {
        case info
        case sensors
        
        var cellIdentifier: String {
            switch self {
            case .info:     return "InfoCell"
            case .sensors:  return "SensorCell"
            }
        }
    }

}
