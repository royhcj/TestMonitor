//
//  Probe.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/10.
//  Copyright © 2019 hwacom. All rights reserved.
//

import Foundation

struct Probe {
    var id: Int?
    var name: String?
    var url: String?
    var tags: [String]?
    var priority: Int?
    var fixed: Int?
    var hascomment: Int?
    var statusRaw: Int?
    var active: Bool?
    var device: [Device] = []
    var organizations: [Organization] = []
    
}

struct Organization {
    var id: Int?
    var name: String?
    var url: String?
    var tags: [String]?
    var priority: Int?
    var fixed: Int?
    var hascomment: Int?
    var statusRaw: Int?
    var active: Bool?
    var devices: [Device] = []
}

struct Device {
    
}
