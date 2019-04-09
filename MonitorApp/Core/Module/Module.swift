//
//  Module.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/9.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class Module {
    var children: [Module] = []
    weak var parent: Module?
    
    var sourceDisplayContext: DisplayContext?
    var view: UIViewController?
    
    
    /// - Installs a sub-module.
    ///
    /// - Parameters:
    ///   - module: Sub-module to install with.
    ///   - displayContext: Display context to show sub-module's view.
    func install(module: Module, displayContext: DisplayContext?) {
        children.append(module)
        module.parent = self
        
        module.sourceDisplayContext = displayContext
        
        module.setup()
        
        if let view = module.view {
            displayContext?.display(view)
        }
    }
    
    /// Uninstalls a sub-module.
    ///
    /// - Parameter module: Sub-module to uninstall.
    func uninstall(module: Module) {
        children.removeAll { $0 === module }
        module.parent = nil
        
        if let view = module.view {
            sourceDisplayContext?.undisplay(view)
        }
    }
    
    func setup() {
        // Override this function
    }
    
    
    
}
