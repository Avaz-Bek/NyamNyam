//
//  AboutFoodCVCell.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/13/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
protocol FavoriteDishesDelegate: class {
    func didTapOrderButton(_ btn:UIButton)
    func didTapHeartButton(_ btn:UIButton)
}

class FavoriteDishesVCCell: UICollectionViewCell {
    
    var delegate: FavoriteDishesDelegate?
    
    //MARK : outlets
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var tripperLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    //MARK: properties
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var tripperLabelValue:Int = 1
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:Actions
    @IBAction func favouriteButtonClick(_ sender: UIButton) {
        
        if let delegate = self.delegate{
            delegate.didTapHeartButton(sender)
        }
    }
    
    @IBAction func leftButtonClick(_ sender: UIButton) {
        
        if tripperLabelValue == 1{
            sender.shake(sender: sender)
        }else {
            tripperLabelValue -= 1
            tripperLabel.text = String(tripperLabelValue)
        }
    }
    
    @IBAction func rightButtonClick(_ sender: UIButton) {
        if tripperLabelValue == 20{
            sender.shake(sender: sender)
        }else {
            leftButton.isHidden = false
            tripperLabelValue += 1
            //weightValue += weightOldValue
            tripperLabel.text = String(tripperLabelValue)
            //weightLabel.text = String(weightValue) + "гр"
        }
    }
    
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        if let delegate = self.delegate{
            delegate.didTapOrderButton(sender)
        }
    }
    
}
