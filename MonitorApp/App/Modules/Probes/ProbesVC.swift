//
//  ProbesVC.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/10.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class ProbesVC: UIViewController,
                UITableViewDataSource,
                UITableViewDelegate {

    @IBOutlet var tableView: UITableView!

    var probes: [Probe] = []
    
    // MARK: - Object lifecycle
    static func make() -> ProbesVC {
        let vc = UIStoryboard(name: "Probes", bundle: nil)
                    .instantiateViewController(withIdentifier: "ProbesVC")
                    as! ProbesVC
        return vc
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register table cells
        tableView.register(UINib(nibName: "CommonMonitorCell", bundle: nil),
            forCellReuseIdentifier: CommonMonitorCell.identifier)

        SampleProbesData.shared.getSampleProbes { probes in
            self.probes = probes
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshProbes()
    }
    
    // MARK: - TableVIew DataSource/Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return probes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommonMonitorCell.identifier,
                                                 for: indexPath)
        let probe = probes[indexPath.row]
        
        if let cell = cell as? CommonMonitorCell {
            cell.titleLabel.text = probe.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let probe = probes[indexPath.row]
        
        let vc = OrganizationsVC.make(organizations: probe.organizations)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Refresh Methods
    func refreshProbes() {
        tableView.reloadData()
    }
    
    // MARK: - Type Definitions
    typealias Cell = CommonMonitorCell

}
