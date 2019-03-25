//
//  AboutFoodCVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/13/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import UIKit

class FoodsVC: UICollectionViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var array = ["150","140","340","213","245","345","65"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        registerXib()
    }
    
    func registerXib(){
        collectionView.register(FoodsVCCell.nib, forCellWithReuseIdentifier: FoodsVCCell.identifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodsVCCell.identifier, for: indexPath) as! FoodsVCCell
        
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius  = 10
        
        
        //cell.aboutFoodImage.layer.masksToBounds = true
        //cell.aboutFoodImage.layer.cornerRadius = 10
        
        cell.foodName.text = "Рыба жареная"
        
        cell.leftButton.layer.masksToBounds = true
        cell.leftButton.layer.borderWidth = 0.5
        cell.leftButton.layer.cornerRadius = cell.leftButton.frame.height/3
        cell.leftButton.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
        cell.leftButton.layer.borderColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1).cgColor
        cell.leftButton.setTitleColor(UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1), for: UIControl.State.normal)
        
        cell.tripperLabel.layer.masksToBounds = true
        cell.tripperLabel.layer.borderColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1).cgColor
        cell.tripperLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1), thickness: 0.5)
        cell.tripperLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1), thickness: 0.5)
        cell.tripperLabel.textColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        //cell.tripperLabel.text = "250"+"гр"
        
        cell.rightButton.layer.masksToBounds = true
        cell.rightButton.layer.borderWidth = 0.5
        cell.rightButton.layer.cornerRadius = cell.rightButton.frame.height/3
        cell.rightButton.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        cell.rightButton.layer.borderColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1).cgColor
        cell.rightButton.setTitleColor(UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1), for: UIControl.State.normal)
        
        cell.weightLabel.text = array[indexPath.row] + "гр"
        
        
        cell.orderButton.layer.masksToBounds = true
        cell.orderButton.layer.borderWidth = 0.5
        cell.orderButton.layer.borderColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1).cgColor
        cell.orderButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: UIControl.State.normal)
        cell.orderButton.layer.cornerRadius = cell.orderButton.frame.height/3
        
        cell.orderButton.setTitle( "100c", for: UIControl.State.normal)
        cell.orderButton.titleLabel?.textColor = UIColor.white
        cell.orderButton.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        //        cell.orderButton.setImage(UIImage(named: "Icon-App-40x40"), for: UIControl.State.normal)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
extension FoodsVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 140)
    }
}


extension FoodsVC: AboutFoodDelegate{
    func tapedHeart() {
        print("sdfsd")
    }
}


extension FoodsVC:UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("EndEdition")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("BeginEdition")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cencel")
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search")
        
        self.searchController.dismiss(animated: true, completion: nil)
    }
}


extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: thickness)
            
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.bounds.height - thickness,  width: UIScreen.main.bounds.width, height: thickness)
            
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0,  width: thickness, height: self.bounds.height)
            
        case UIRectEdge.right:
            border.frame = CGRect(x: self.bounds.width - thickness, y: 0,  width: thickness, height: self.bounds.height)
        default:
            break
        }
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
}





