//
//  SensorsVC+Cells.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/11.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class SensorsVCInfoCell: UITableViewCell {
    @IBOutlet var probeNameLabel: UILabel!
    @IBOutlet var organizationNameLabel: UILabel!
    @IBOutlet var deviceLabel: UILabel!
    
    
}

class SensorsVCSensorCell: UITableViewCell {
    @IBOutlet var sensorNameLabel: UILabel!
    @IBOutlet var sensorStatusLabel: UILabel!
    @IBOutlet var sensorLatestLabel: UILabel!
    
}

extension SensorsVC {
    typealias InfoCell = SensorsVCInfoCell
    typealias SensorCell = SensorsVCSensorCell
}
