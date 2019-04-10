//
//  SampleData.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/10.
//  Copyright © 2019 hwacom. All rights reserved.
//

import Foundation
import Ono

class SampleProbesData: NSObject, XMLParserDelegate {
    
    static let shared = SampleProbesData()
    
    func getSampleProbes(completion: (([Probe]) -> ())) {
        var probes: [Probe] = []
        
        guard let path = Bundle.main.path(forResource: "SampleProbes", ofType: "xml"),
              let data = try? Data.init(contentsOf: URL(fileURLWithPath: path))
        else {
            completion([])
            return
        }
        
        guard let document = try? ONOXMLDocument.htmlDocument(with: data)
        else {
            completion([])
            return
        }
        
        let sensortreeNodes = document.rootElement.firstChild(withXPath: "body/prtg/sensortree/nodes/group")
        
        let probeNodes = sensortreeNodes?.children(withTag: "probenode")
        
        probeNodes?.forEach { pn in
            var probe = Probe()
            probe.id        = pn.attributes["id"] as? Int
            probe.name      = pn.firstChild(withTag: "name")?.stringValue
            probe.url       = pn.firstChild(withTag: "url")?.stringValue
            //probe.tags // TODO: later
            probe.priority  = pn.firstChild(withTag: "priority")?.numberValue?.intValue
            probe.fixed     = pn.firstChild(withTag: "fixed")?.numberValue?.intValue
            probe.hascomment = pn.firstChild(withTag: "hascomment")?.numberValue?.intValue
            probe.statusRaw = pn.firstChild(withTag: "status_raw")?.numberValue?.intValue
            probe.active    = pn.firstChild(withTag: "active")?.stringValue == "true"
            
            let groups = pn.children(withTag: "group")
            groups.forEach { on in
                var org = Organization()
                org.id        = on.attributes["id"] as? Int
                org.name      = on.firstChild(withTag: "name")?.stringValue
                org.url       = on.firstChild(withTag: "url")?.stringValue
                //probe.tags // TODO: later
                org.priority  = on.firstChild(withTag: "priority")?.numberValue?.intValue
                org.fixed     = on.firstChild(withTag: "fixed")?.numberValue?.intValue
                org.hascomment = on.firstChild(withTag: "hascomment")?.numberValue?.intValue
                org.statusRaw = on.firstChild(withTag: "status_raw")?.numberValue?.intValue
                org.active    = on.firstChild(withTag: "active")?.stringValue == "true"
                
                probe.organizations.append(org)
            }
            
            
            probes.append(probe)
            
        }
        
        completion(probes)
    }
    /*
    func getSampleProbes(completion: (([Probe]) -> ())) {
        var probes: [Probe] = []
        
        guard let path = Bundle.main.path(forResource: "SampleProbes", ofType: "xml"),
              let data = try? Data.init(contentsOf: URL(fileURLWithPath: path))
        else {
            completion([])
            return
        }
        
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
        completion([])
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        print("► parse start")
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("► parse ended")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?,
                attributes attributeDict: [String : String] = [:]) {
        print("► started: \(elementName) / \(namespaceURI ?? "")")
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?) {
        print("► ended: \(elementName) / \(namespaceURI ?? "")")
    }
        */
}
