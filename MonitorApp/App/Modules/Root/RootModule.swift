//
//  RootModule.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/9.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class RootModule: Module {
    
    var rootVC: RootVC?
    
    override func setup() {
        rootVC = RootVC()
        
        view = rootVC
    }
    
}
