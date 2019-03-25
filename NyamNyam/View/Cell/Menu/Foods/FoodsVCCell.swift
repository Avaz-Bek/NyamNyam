//
//  AboutFoodCVCell.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/13/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
protocol AboutFoodDelegate: class {
    func tapedHeart()
}

class FoodsVCCell: UICollectionViewCell {
    
    var delegate: AboutFoodDelegate?
    
    //MARK : outlets
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var tripperLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
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
    
    
    @IBAction func tapedHeart(_ sender: UIButton) {
        if let delegate = self.delegate{
            delegate.tapedHeart()
            
        }
    }
    
    //MARK:Actions
    @IBAction func favouriteButtonClick(_ sender: UIButton) {
        
        if sender.tag == 0 {
            favoriteButton.setImage(UIImage(named: "heart-cencel"), for: UIControl.State.normal)
            sender.tag += 1
        }else if sender.tag == 1{
            favoriteButton.setImage(UIImage(named: "heart-ok"), for: UIControl.State.normal)
            sender.tag -= 1
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
    
}

extension UIButton{
    func shake(sender:UIButton) {
        
//        let shake = CABasicAnimation(keyPath: "position")
//        shake.duration = 0.1
//        shake.repeatCount = 1
//        shake.autoreverses = true
//
//
//        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
//        let fromValue = NSValue(cgPoint: fromPoint)
//
//        let toPoint = CGPoint(x: center.x + 5, y: center.y)
//        let toValue = NSValue(cgPoint: toPoint)
//
//        shake.fromValue = fromValue
//        shake.toValue = toValue
//
//        layer.add(shake, forKey: nil)

  
        UIView.animate(withDuration: 0.3, animations: {
            sender.alpha = 1
            sender.backgroundColor = UIColor.orange
        }, completion: { completed in
            if completed {
                UIView.animate(withDuration: 0.3, animations: {
                    sender.backgroundColor = UIColor.clear
                }, completion: { completed in
                    if completed {
                    }
                })
            }
        })
        
    }
}
