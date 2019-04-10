//
//  SideMenuVC+Cells.swift
//  MonitorApp
//
//  Created by Roy Hu on 2019/4/10.
//  Copyright © 2019 hwacom. All rights reserved.
//

import UIKit

class SideMenuVCCell: UITableViewCell {
    
    static let identifier = "Cell"
    
    @IBOutlet var icon: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func configure(with row: SideMenuVC.RowType) {
        icon.image = row.icon()
        titleLabel.text = row.title()
    }
}

extension SideMenuVC {
    typealias Cell = SideMenuVCCell
}
