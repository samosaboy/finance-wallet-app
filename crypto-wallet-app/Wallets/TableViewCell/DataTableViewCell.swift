//
//  DataTableViewCell.swift
//  crypto-wallet-app
//
//  Created by Hackintoshi9 on 2019-12-26.
//  Copyright © 2019 sam0sab0y. All rights reserved.
//

import UIKit
import SwiftIcons

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.backgroundColor = UIColor(rgb: 0xEBFCF7)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(UIColor(rgb: 0x1FC496), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.sizeToFit()
        button.layer.cornerRadius = button.frame.size.height / 2.0
        
        icon.contentMode = .scaleAspectFit
    }
}
