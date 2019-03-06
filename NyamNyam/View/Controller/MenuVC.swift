//
//  MenuCollectionVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/5/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MenuVC: UIViewController{

    // MARK: - Outlets
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    // MARK: - Properties
    let array:[String]  = ["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.layer.cornerRadius = 7
        myCollectionView.layer.masksToBounds = true
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        let itemWidth = UIScreen.main.bounds.size.width/2-8
        let itemHeight = UIScreen.main.bounds.size.height/3
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.collectionView?.layer.cornerRadius = 7
        layout.collectionView?.layer.masksToBounds = true
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        
        myCollectionView.collectionViewLayout = layout
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}


    // MARK: - Data source
extension MenuVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuItemIdentifier", for: indexPath) as! MenuCell
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius  = 10
        cell.menuItemImage.image = UIImage(named: array[indexPath.row] )
        cell.menuItemImage.layer.masksToBounds = true
        cell.menuItemImage.layer.cornerRadius = 10
        cell.menuItemImage.translatesAutoresizingMaskIntoConstraints  = false
        cell.menuItemImage.contentMode = .scaleAspectFill
        
        
        cell.menuItemName.text = "Основные блюда"
        cell.menuItemName.font = UIFont(name: "Roboto-Medium", size: 12)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
//        if let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GalleryImageVC") as? GalleryImageVC {
//            
//            
//            //secondVC.image = UIImage(named: array[indexPath.row])!
//            self.present(secondVC, animated: true, completion: nil)
            
            
        }
    }
    
    
    

