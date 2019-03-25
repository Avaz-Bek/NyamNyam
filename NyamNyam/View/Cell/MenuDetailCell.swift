//
//  MenuDetailCell.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/8/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
protocol MenuDetailCellDelegate {
    func didTapFavouriteButton()
    func didTapOrderButton()
}
class MenuDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var menuDetailItemMainImage: UIImageView!
    @IBOutlet weak var menuDetailItemName: UILabel!
    @IBOutlet weak var menuDetailItemWeight: UILabel!
    @IBOutlet weak var menuDetailItemFavoriteButton: UIButton!
    @IBOutlet weak var menuDetailItemOrderButton: UIButton!
    @IBOutlet weak var leftTripperButton: UIButton!
    @IBOutlet weak var rightTripperButton: UIButton!
    @IBOutlet weak var tripperLabel: UILabel!
    
    let  delegete:MenuDetailCellDelegate? = nil
    var tripperLabelValue:Int = 1
    var weightValue:Int = 0
    
    @IBAction func favouriteButtonClick(_ sender: UIButton) {

        if sender.tag == 0 {
                    menuDetailItemFavoriteButton.setImage(UIImage(named: "heart-cencel"), for: UIControl.State.normal)
            sender.tag += 1
        }else if sender.tag == 1{
                    menuDetailItemFavoriteButton.setImage(UIImage(named: "heart-ok"), for: UIControl.State.normal)
            sender.tag -= 1
        }
        
        delegete?.didTapFavouriteButton()
    }
    
    
    @IBAction func leftButtonClick(_ sender: Any) {
    
        if tripperLabelValue == 1{
            leftTripperButton.isHidden = false
        }else {
            tripperLabelValue -= 1
            weightValue /= tripperLabelValue
            menuDetailItemWeight.text = String(tripperLabelValue)
            tripperLabel.text = String(weightValue)
        }
    }
    @IBAction func rightButtonClick(_ sender: Any) {
        if tripperLabelValue == 20{
            rightTripperButton.isHidden = false
        }else {
            leftTripperButton.isHidden = false
            tripperLabelValue += 1
            weightValue *= tripperLabelValue
            menuDetailItemWeight.text = String(tripperLabelValue)
            tripperLabel.text = String(weightValue)
        }
    }
    @IBAction func orderButtonClick(_ sender: UIButton) {
        
        UIButton.animate(withDuration: 0.2,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 1.10, y: 1.10)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.2, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
        delegete?.didTapOrderButton()
    }
}
