//
//  SideMenuVC.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/10.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController,
                  UITableViewDataSource, UITableViewDelegate {
    
    var sections: [SectionType] = [.info, .settings]
    
    // MARK: - Object lifecycle
    static func make() -> SideMenuVC {
        let vc = UIStoryboard(name: "SideMenu", bundle: nil)
                    .instantiateViewController(withIdentifier: "SideMenuVC")
                    as! SideMenuVC
        return vc
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - TableView DataSource/Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection index: Int) -> Int {
        let section = sections[index]
        return section.rows().count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let row = section.rows()[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(
                        withIdentifier: Cell.identifier,
                        for: indexPath)
        if let cell = cell as? Cell {
            cell.configure(with: row)
        }
        return cell
        
    }
    
    // Type Definitions
    enum SectionType {
        case info
        case settings
        
        func title() -> String {
            switch self {
            case .info:     return "網管功能"
            case .settings: return "設定"
            }
        }
        
        func rows() -> [RowType] {
            switch self {
            case .info:     return [.probes, .alerts]
            case .settings: return [.account]
            }
        }
    }
    
    enum RowType {
        case probes
        case alerts
        case account
        
        func title() -> String {
            switch self {
            case .probes:   return "設備狀況"
            case .alerts:   return "警報清單"
            case .account:  return "帳戶設定"
            }
        }
        
        func icon() -> UIImage {
            switch self {
            case .probes:   return UIImage()
            case .alerts:   return UIImage()
            case .account:  return UIImage()
            }
        }
    }
}
