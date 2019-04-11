//
//  Probe.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/10.
//  Copyright © 2019 hwacom. All rights reserved.
//

import Foundation
import Ono

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
    var devices: [Device] = []
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
    var id: Int?
    var summary: [Int]?
    var name: String?
    var deviceIcon: String?
    var url: String?
    var tags: [String]?
    var priority: Int?
    var fixed: Int?
    var hascomment: Int?
    var host: String?
    var statusRaw: Int?
    var active: Bool?
    var sensors: [Sensor] = []
}

struct Sensor {
    var id: Int?
    var name: String?
    var url: String?
    var tags: [String]?
    var priority: Int?
    var fixed: Int?
    var hascomment: Int?
    var sensorType: String?
    var sensorKind: String?
    var interval: TimeInterval?
    var statusRaw: Int?
    var status: String?
    var dataMode: Int?
    var lastValue: String?
    var lastValueRaw: Double?
    var statusMessage: String?
    var statusSinceRawUTC: TimeInterval?
    var lastTimeRawUTC: TimeInterval?
    var lastOKRawUTC: TimeInterval?
    var lastErrorRawUTC: TimeInterval?
    var lastUpRawUTC: TimeInterval?
    var lastDownRawUTC: TimeInterval?
    var cumulatedDownTimeRaw: TimeInterval?
    var cumulatedUpTimeRaw: TimeInterval?
    var cumulatedSinceRaw: TimeInterval?
    var active: Bool?
}

struct OwnershipInfo {
    var ownerProbeID: Int?
    var ownerProbeName: String?
    var ownerOrganizationID: Int?
    var ownerOrganizationName: String?
    var ownerDeviceID: Int?
    var ownerDeviceName: String?
    var ownerDeviceHost: String?
}


extension Device {
    mutating func parse(element ele: ONOXMLElement) {
        id         = ele.attributes["id"] as? Int
        summary    = (ele.firstChild(withTag: "summary")?.stringValue?.split(separator: ",").compactMap { Int($0) })
        name       = ele.firstChild(withTag: "name")?.stringValue
        deviceIcon = ele.firstChild(withTag: "deviceicon")?.stringValue
        url        = ele.firstChild(withTag: "url")?.stringValue
        tags       = ele.firstChild(withTag: "tags")?.stringValue?.split(separator: " ").map { String($0) }
        priority   = ele.firstChild(withTag: "priority")?.numberValue?.intValue
        fixed      = ele.firstChild(withTag: "fixed")?.numberValue?.intValue
        hascomment = ele.firstChild(withTag: "hascomment")?.numberValue?.intValue
        host       = ele.firstChild(withTag: "host")?.stringValue
        statusRaw  = ele.firstChild(withTag: "status_raw")?.numberValue?.intValue
        active     = ele.firstChild(withTag: "active")?.stringValue == "true"
        
        let sensorElements = ele.children(withTag: "sensor")
        sensorElements.forEach {
            var sensor = Sensor()
            sensor.parse(element: $0)
            sensors.append(sensor)
        }
    }
}

extension Sensor {
    mutating func parse(element ele: ONOXMLElement) {
        id        = ele.attributes["id"] as? Int
        name      = ele.firstChild(withTag: "name")?.stringValue
        url       = ele.firstChild(withTag: "url")?.stringValue
        tags      = ele.firstChild(withTag: "tags")?.stringValue?.split(separator: " ").map { String($0) }
        priority  = ele.firstChild(withTag: "priority")?.numberValue?.intValue
        fixed     = ele.firstChild(withTag: "fixed")?.numberValue?.intValue
        hascomment = ele.firstChild(withTag: "hascomment")?.numberValue?.intValue
        sensorType = ele.firstChild(withTag: "sensortype")?.stringValue
        sensorKind = ele.firstChild(withTag: "sensorkind")?.stringValue
        interval  = ele.firstChild(withTag: "interval")?.numberValue?.doubleValue
        statusRaw = ele.firstChild(withTag: "status_raw")?.numberValue?.intValue
        dataMode  = ele.firstChild(withTag: "datamode")?.numberValue?.intValue
        lastValue           = ele.firstChild(withTag: "lastvalue")?.stringValue
        lastValueRaw        = ele.firstChild(withTag: "lastvalue_raw")?.numberValue?.doubleValue
        statusMessage       = ele.firstChild(withTag: "statusmessage")?.stringValue
        statusSinceRawUTC   = ele.firstChild(withTag: "statussince_raw_utc")?.numberValue?.doubleValue
        lastTimeRawUTC      = ele.firstChild(withTag: "lasttime_raw_utc")?.numberValue?.doubleValue
        lastOKRawUTC        = ele.firstChild(withTag: "lastok_raw_utc")?.numberValue?.doubleValue
        lastErrorRawUTC     = ele.firstChild(withTag: "lasterror_raw_utc")?.numberValue?.doubleValue
        lastUpRawUTC        = ele.firstChild(withTag: "lastup_raw_utc")?.numberValue?.doubleValue
        lastDownRawUTC      = ele.firstChild(withTag: "lastdown_raw_utc")?.numberValue?.doubleValue
        cumulatedDownTimeRaw = ele.firstChild(withTag: "cumulateddowntime_raw")?.numberValue?.doubleValue
        cumulatedUpTimeRaw  = ele.firstChild(withTag: "cumulateduptime_raw")?.numberValue?.doubleValue
        cumulatedSinceRaw   = ele.firstChild(withTag: "cumulatedsince_raw")?.numberValue?.doubleValue
        active              = ele.firstChild(withTag: "active")?.stringValue == "true"
    }
}
