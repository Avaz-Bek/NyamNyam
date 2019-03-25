//
//  CallCVCell.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/19/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class CallCVCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var callImage: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }


}


