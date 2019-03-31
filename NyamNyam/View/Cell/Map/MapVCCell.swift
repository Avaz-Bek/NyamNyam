//
//  MapVCCell.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/22/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class MapVCCell: UICollectionViewCell {

    
    
    
    @IBOutlet weak var mapIcon: UIImageView!
    @IBOutlet weak var nameOfRestourant: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var street: UILabel!
    //MARK: properties
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
