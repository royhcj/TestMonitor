//
//  RootVC.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/9.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit
import SideMenu

class RootVC: UIViewController {
    
    var menuNavigationController: UISideMenuNavigationController?
    var sideMenuVC: SideMenuVC?
    
    var rootNavigationController = UINavigationController()
    var currentVC: UIViewController?
    
    enum ViewType {
        case probes     // 根目錄
        case critical   // 警報清單
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        createSideMenu()
        
        createRootNavigationController()
        
        changeToView(for: .probes)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    // MARK: - Menu Navigation Controller
    func createSideMenu() {
        
        // Create SideMenu
        let sideMenuVC = SideMenuVC.make()
        
        // Create MenuNavigationController
        menuNavigationController = UISideMenuNavigationController(rootViewController: sideMenuVC)
        SideMenuManager.default.menuLeftNavigationController = menuNavigationController
        
        SideMenuManager.default.menuAddPanGestureToPresent(toView: rootNavigationController.view)

    }
    
    func createRootNavigationController() {
        rootNavigationController.view
            .autoresizingMask = [.flexibleWidth, .flexibleHeight]
        rootNavigationController.view
            .translatesAutoresizingMaskIntoConstraints = true
        addChild(rootNavigationController)
        self.view.addSubview(rootNavigationController.view)
        rootNavigationController.didMove(toParent: self)
    }
    
    // MARK: - View Management
    func changeToView(for viewType: ViewType) {
        
        var vc: UIViewController
        
        switch viewType {
        case .probes:
            vc = ProbesVC()
        case .critical:
            vc = SideMenuVC()
        }
        
        setCurrentVC(vc)
    }
    
    func setCurrentVC(_ vc: UIViewController) {
        rootNavigationController.setViewControllers([vc], animated: false)
        currentVC = vc
    }
    
    

}
