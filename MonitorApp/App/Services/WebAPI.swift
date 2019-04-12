//
//  WebAPI.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/12.
//  Copyright © 2019 hwacom. All rights reserved.
//

import Foundation
import IORequestable
import Moya

protocol WebIORequestable: MoyaIORequestable {}
extension WebIORequestable {
    var baseURL: URL {
        return URL(string: "https://163.19.163.170:1443")!
    }
}


class WebAPI {
    
    struct GetChannels: WebIORequestable {
        var spec = Spec(.get, "/api/table.xml?",
                        inputEncoding: .urlParameter,
                        outputDecoding: .rawData)
        
        struct Input: Encodable {
            var id: Int
            var userName: String
            var passhash: String
            var content: String
            var output: String
            var columns: String
        }
        
        typealias Output = Data
        
        //https://163.19.163.170:1443/api/table.xml?username=prtgadmin&passhash=1098748320&content=channels&output=xml&columns=name,lastvalue_&id=17698
    }
    
}
