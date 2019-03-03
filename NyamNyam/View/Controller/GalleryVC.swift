//
//  GalleryVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/1/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

struct DeviceInfo {
    struct Orientation {
        // indicate current device is in the LandScape orientation
        static var isLandscape: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                    ? UIDevice.current.orientation.isLandscape
                    : UIApplication.shared.statusBarOrientation.isLandscape
            }
        }
        // indicate current device is in the Portrait orientation
        static var isPortrait: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                    ? UIDevice.current.orientation.isPortrait
                    : UIApplication.shared.statusBarOrientation.isPortrait
            }
        }
    }}

class GalleryVC: UIViewController,UIViewControllerTransitioningDelegate{
    
    let transition = CircularTransition()
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let array:[String]  = ["images","images","images","images","images","images","images","images","images","images","images","images-1","images","images","images","images","images","images","images","images","images"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var itemWidth:CGFloat = 0
        var itemHeight:CGFloat = 0
        
        if DeviceInfo.Orientation.isLandscape {
          itemWidth = UIScreen.main.bounds.size.width/7 - 3
          itemHeight = UIScreen.main.bounds.size.height/4 - 1
        }else if DeviceInfo.Orientation.isPortrait{
            itemWidth = UIScreen.main.bounds.size.width/4 - 1
            itemHeight = UIScreen.main.bounds.size.height/7 - 1
        }
        print(UIScreen.main.bounds.size)
        
    
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        myCollectionView.collectionViewLayout = layout

        
        
        // Do any additional setup after loading the view.
    }
    


    
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let secondVC = segue.destination as! GalleryImageVC
//        secondVC.transitioningDelegate = self
//        secondVC.modalPresentationStyle = .custom
//    }
 

}


extension GalleryVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryImagesCell", for: indexPath) as! GalleryCell
        cell.galleryImages.image = UIImage(named: "images-1" + ".jpg")
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
            
            secondVC.image = UIImage(named: array[indexPath.row])!
            self.present(secondVC, animated: true, completion: nil)
            

        }
    }

    
    
}
