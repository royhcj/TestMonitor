//
//  SensorVC.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/11.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class SensorVC: UIViewController,
                UITableViewDataSource,
                UITableViewDelegate {
    
    var sensor: Sensor?
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Object lifecycle
    static func make(sensor: Sensor?) -> SensorVC {
        let vc = UIStoryboard(name: "Sensor", bundle: nil)
                    .instantiateViewController(withIdentifier: "SensorVC")
                    as! SensorVC
        vc.sensor = sensor
        return vc
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshSensor()
    }
    
    // MARK: - Table DataSource/Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID: String = {
            switch indexPath.row {
            case 0: return "InfoCell"
            case _: return "StatusCell"
            }
        }()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        if let cell = cell as? InfoCell {
            cell.sensorNameLabel.text = sensor?.name
        } else if let cell = cell as? StatusCell {
            print(cell)
        }
        
        return cell
    }
    
    // MARK: - Reload Methods
    func refreshSensor() {
        tableView.reloadData()
    }


}
