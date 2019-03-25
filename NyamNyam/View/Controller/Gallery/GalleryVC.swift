//
//  GalleryVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/1/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController,UIViewControllerTransitioningDelegate{
    
    let transition = CircularTransition()
    
    // MARK: - Outlets
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    // MARK: - Properties
    let array:[String]  = ["povar1","povar2","images","images","povar3","images","images","images","povar3","images","images","images-1","povar3","images","povar4","images","images","images","images","images","povar1"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemWidth = UIScreen.main.bounds.size.width/2-8
        let itemHeight = UIScreen.main.bounds.size.height/3.5
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        myCollectionView.collectionViewLayout = layout

    }
    


    // MARK: - 
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = myCollectionView.center
        transition.circleColor = myCollectionView.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = myCollectionView.center
        transition.circleColor = myCollectionView.backgroundColor!
        
        return transition
    }
    
    // MARK: - Navigation

}


// MARK: - Data source
extension GalleryVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryImagesCell", for: indexPath) as! GalleryCell
        cell.galleryImages.image = UIImage(named: array[indexPath.row] + ".jpg")
        cell.galleryImages.layer.masksToBounds = true
        cell.galleryImages.layer.cornerRadius = 7
        cell.galleryImages.translatesAutoresizingMaskIntoConstraints  = false
        cell.galleryImages.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GalleryImageVC") as? GalleryImageVC {
            
            secondVC.transitioningDelegate = self
            secondVC.modalPresentationStyle = .overFullScreen
            
            secondVC.image = UIImage(named: array[indexPath.row] + ".jpg")!
            self.present(secondVC, animated: true, completion: nil)
            
        }
    }

    
    
}
