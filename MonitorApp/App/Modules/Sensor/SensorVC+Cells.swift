//
//  SensorVC+Cells.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/11.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class SensorVCInfoCell: UITableViewCell {
    
    @IBOutlet var probeNameLabel: UILabel!
    @IBOutlet var organizationNameLabel: UILabel!
    @IBOutlet var deviceNameLabel: UILabel!
    
    @IBOutlet var sensorIcon: UIImageView!
    @IBOutlet var sensorNameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
}

class SensorVCStatusCell: UITableViewCell {
    
    @IBOutlet var incomingTrafficLabel: UILabel!
    @IBOutlet var incomingBroadcastPacketsLabel: UILabel!
    @IBOutlet var incomingErrorPacketsLabel: UILabel!
    @IBOutlet var incomingDisposedPacketsLabel: UILabel!
    @IBOutlet var outgoingTrafficLabel: UILabel!
    @IBOutlet var outgoingBroadcastPacketsLabel: UILabel!
    @IBOutlet var outgoingErrorPacketsLabel: UILabel!
    @IBOutlet var outgoingDisposedPacketsLabel: UILabel!
    @IBOutlet var activeStatusLabel: UILabel!
    @IBOutlet var connectionStatusLabel: UILabel!
    
}


extension SensorVC {
    typealias InfoCell = SensorVCInfoCell
    typealias StatusCell = SensorVCStatusCell
}
