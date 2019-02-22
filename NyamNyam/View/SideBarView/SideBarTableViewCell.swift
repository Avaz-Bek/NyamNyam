//
//  SideBarTableViewCell.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 2/22/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class SideBarTableViewCell: UITableViewCell {

    @IBOutlet weak var sideImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
