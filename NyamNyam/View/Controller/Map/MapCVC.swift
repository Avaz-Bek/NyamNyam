//
//  AboutFoodCVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/13/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import UIKit

class MapCVC: UICollectionViewController {
    var array = ["150","140","340","213","245","345","65"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXib()
    }
    
    func registerXib(){
        collectionView.register(MapVCCell.nib, forCellWithReuseIdentifier: MapVCCell.identifier)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapVCCell.identifier, for: indexPath) as! MapVCCell
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius  = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 375, height: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailMapVC") is DetailMapVC {
            self.performSegue(withIdentifier: "detailMapVC", sender: nil)
        }
        
        
    }
}

extension MapCVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-16, height: 80)
    }
}





