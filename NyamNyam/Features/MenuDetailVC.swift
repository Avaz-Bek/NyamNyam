//
//  MenuDetailVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/7/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class MenuDetailVC: UIViewController ,UISearchBarDelegate{

    // MARK: Outlets
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    // MARK: - Properties
    private let reuseIdentifier = "menuDetailIdentifier"
    private let menuDetailItemImagesName = ["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        let itemWidth = UIScreen.main.bounds.size.width - 16
        let itemHeight = UIScreen.main.bounds.size.height/4.5
        
        print(itemHeight)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.collectionView?.layer.cornerRadius = 10
        layout.collectionView?.layer.masksToBounds = true
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        
        myCollectionView.collectionViewLayout = layout
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MenuDetailVC:UICollectionViewDelegate,UICollectionViewDataSource,MenuDetailCellDelegate{
    func didTapFavouriteButton() {
        print("Button1")
    }
    
    func didTapOrderButton() {
        print("Button2")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuDetailItemImagesName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuDetailCell
        
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius  = 10
        
        cell.menuDetailItemMainImage.layer.masksToBounds = true
        cell.menuDetailItemMainImage.layer.cornerRadius = 10
        
        cell.menuDetailItemName.text = "Рыба жареная"
        
        cell.leftTripperButton.layer.masksToBounds = true
        cell.leftTripperButton.layer.borderWidth = 1.5
        cell.leftTripperButton.layer.cornerRadius = cell.leftTripperButton.frame.height/3
        cell.leftTripperButton.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
        cell.leftTripperButton.layer.borderColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1).cgColor

        cell.tripperLabel.layer.masksToBounds = true
        cell.tripperLabel.layer.borderWidth = 1.5
        cell.tripperLabel.layer.borderColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1).cgColor
        cell.tripperLabel.text = String(cell.tripperLabelValue)
        cell.rightTripperButton.layer.masksToBounds = true
        cell.rightTripperButton.layer.borderWidth = 1.5
        cell.rightTripperButton.layer.cornerRadius = cell.rightTripperButton.frame.height/3
        cell.rightTripperButton.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        cell.rightTripperButton.layer.borderColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1).cgColor

        cell.menuDetailItemWeight.text = "250гр."
        
        cell.menuDetailItemOrderButton.layer.masksToBounds = true
        cell.menuDetailItemOrderButton.layer.cornerRadius = cell.menuDetailItemOrderButton.frame.height/3
        
        cell.menuDetailItemOrderButton.setTitle( menuDetailItemImagesName[indexPath.row], for: UIControl.State.normal)
        return cell
    }
    
}

