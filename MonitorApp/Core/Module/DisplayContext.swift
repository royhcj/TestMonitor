//
//  DisplayContext.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/9.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class DisplayContext {
    enum Method {
        case present(_ source: UIViewController, animated: Bool)
        case push(_ source: UINavigationController, animated: Bool)
        case embed(_ source: UIViewController, view: UIView?)
    }
    
    var method: Method
    
    init(method: Method) {
        self.method = method
    }
    
    func display(_ vc: UIViewController) {
        switch method {
        case .present(let source, let animated):
            source.present(vc, animated: animated, completion: nil)
        case .push(let source, let animated):
            source.pushViewController(vc, animated: animated)
        case .embed(let source, let view):
            guard let view = view ?? source.view
            else { return }
            
            vc.view.frame = view.bounds
            vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            vc.view.translatesAutoresizingMaskIntoConstraints = true
            source.addChild(vc)
            view.addSubview(vc.view)
            vc.didMove(toParent: source)
        }
    }
    
    func undisplay(_ vc: UIViewController) {
        switch method {
        case .present(_, let animated):
            vc.dismiss(animated: animated, completion: nil)
        case .push(let source, let animated):
            source.popViewController(animated: animated)
        case .embed(_, _):
            vc.removeFromParent()
            vc.view.removeFromSuperview()
            vc.didMove(toParent: nil)
        }
    }
}
