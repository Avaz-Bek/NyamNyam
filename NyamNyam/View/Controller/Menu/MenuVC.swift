//
//  MenuCollectionVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/5/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

private let reuseIdentifier = "menuItemIdentifier"

class MenuVC: UIViewController{
    
    
    //MARK: - Outlets
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    // MARK: - Properties
    let foodsName:[[String]]  = [   ["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"],["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"]
    ]
    
    let mainFoodsName:[String]  = ["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"]
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.layer.cornerRadius = 7
        myCollectionView.layer.masksToBounds = true
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        let itemWidth = UIScreen.main.bounds.size.width/2-24
        let itemHeight = UIScreen.main.bounds.size.height/4
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 8, right: 16)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.collectionView?.layer.cornerRadius = 7
        layout.collectionView?.layer.masksToBounds = true
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        
        
        myCollectionView.collectionViewLayout = layout
    }
    
    
    //      MARK: - Navigation
    
    //      In a storyboard-based application, you will often want to do a little preparation before navigation
    //     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        if segue.identifier == "FoodsVC" {
    //
    //        if let indexPath = self.myCollectionView.indexPathsForSelectedItems{
    //            let foodsVC = segue.destination as! FoodsVC
    //                foodsVC.imageNameArray = self.mainFoodsName[indexPath]
    //
    //            }
    //        }
    //     }
    
    
}


// MARK: - Data source
extension MenuVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodsName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCell
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius  = 10
        
        cell.menuItemImage.layer.masksToBounds = true
        cell.menuItemImage.layer.cornerRadius = 10
        cell.menuItemImage.translatesAutoresizingMaskIntoConstraints  = false
        cell.menuItemImage.contentMode = .scaleAspectFit
        //cell.menuItemImage.image = UIImage(named: mainFoodsName[indexPath.row][indexPath.row] )
        
        //cell.menuItemName.text = mainFoodsName[indexPath.row][indexPath.row]
        //cell.menuItemName.font = UIFont(name: "Montserrat-Regular", size: 20)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let foodsVC = self.storyboard?.instantiateViewController(withIdentifier: "FoodsVC") as?  FoodsVC {
            foodsVC.imageNameArray = self.foodsName[indexPath.row]
            foodsVC.largeTitle = self.mainFoodsName[indexPath.row]
            
            self.navigationController?.pushViewController(foodsVC, animated: true)
        }
    }
}


extension MenuVC:UISearchBarDelegate{
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
