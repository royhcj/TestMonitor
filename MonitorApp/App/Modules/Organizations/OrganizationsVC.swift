//
//  OrganizationsVC.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/10.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class OrganizationsVC: UIViewController,
                       UITableViewDataSource,
                       UITableViewDelegate {
    
    var organizations: [Organization] = []
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Object lifecycle
    static func make(organizations: [Organization]?) -> OrganizationsVC {
        let vc = UIStoryboard(name: "Organizations", bundle: nil)
                    .instantiateViewController(withIdentifier: "OrganizationsVC")
                    as! OrganizationsVC
        if let organizations = organizations {
            vc.organizations = organizations
        }
        return vc
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register table cells
        tableView.register(UINib(nibName: "CommonMonitorCell", bundle: nil),
                           forCellReuseIdentifier: CommonMonitorCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshOrganizations()
    }
    
    // MARK: - Table DataSource/Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommonMonitorCell.identifier, for: indexPath)
        let organization = organizations[indexPath.row]
        
        if let cell = cell as? Cell {
            cell.titleLabel.text = organization.name
        }
        
        return cell
    }
    
    // MARK: - Refresh Methods
    func refreshOrganizations() {
        tableView.reloadData()
    }

    // MARK: - Type Definitions
    typealias Cell = CommonMonitorCell
}
