//
//  GalleryIImageVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/2/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class GalleryImageVC: UIViewController,UIViewControllerTransitioningDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closebutton: UIBarButtonItem!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        
        navigationController?.setNavigationBarHidden(true, animated: false)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GalleryImageVC.myviewTapped(_:)))
//        tapGesture.numberOfTapsRequired = 1
//        tapGesture.numberOfTouchesRequired = 1
        
        self.imageView.isUserInteractionEnabled = true
        self.imageView.layer.masksToBounds = true
        self.imageView.clipsToBounds = true
        self.imageView.backgroundColor = UIColor.clear
        //self.imageView.addGestureRecognizer(tapGesture)
        
        let up = UISwipeGestureRecognizer(target : self, action : #selector(GalleryImageVC.upSwipe))
        up.direction = .up
        
        imageView.addGestureRecognizer(up)
        
    }
    
    
    @objc func upSwipe(){
        self.dismiss(animated: true, completion: nil)
    }
    
//    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
//    }
//
//    @objc func dismissGalleryVCWithImage(){
//        self.dismiss(animated: true, completion: nil)
//        print("T##items: Any...##Any")
//    }
//    @IBAction func dismissGalleryVC(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
