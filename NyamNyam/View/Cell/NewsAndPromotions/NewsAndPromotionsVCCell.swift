//
//  NewsAndPromotionsVCCell.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/30/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class NewsAndPromotionsVCCell: UICollectionViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: properties
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    

    
}
