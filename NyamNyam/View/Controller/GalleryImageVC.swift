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
        

        
//
//        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
//            (self.navigationController?.navigationBar.frame.height ?? 0.0)
//        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y:topBarHeight, width: imageView.frame.width, height: topBarHeight))
//        navBar.setBackgroundImage(UIImage(), for: .default)
//        navBar.shadowImage = UIImage()
//        self.view.addSubview(navBar);
//
//        let navItem = UINavigationItem(title: "Галерея");
//        let doneItem = UIBarButtonItem(title: "закрыть", style: .plain, target: navItem, action: nil)
//        navItem.leftBarButtonItem = doneItem;
//        navBar.setItems([navItem], animated: true);
        
        
        
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: false)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GalleryImageVC.myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        
        self.imageView.isUserInteractionEnabled = true
        self.imageView.layer.masksToBounds = true
        self.imageView.clipsToBounds = true
        self.imageView.backgroundColor = UIColor.clear
        
        self.imageView.addGestureRecognizer(tapGesture)
        
        
        let up = UISwipeGestureRecognizer(target : self, action : #selector(GalleryImageVC.upSwipe))
        up.direction = .up
        
        imageView.addGestureRecognizer(up)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func upSwipe(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {

//
//
//        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
//            (self.navigationController?.navigationBar.frame.height ?? 0.0)
//        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y:topBarHeight, width: imageView.frame.width, height: topBarHeight))
//        navBar.setBackgroundImage(UIImage(), for: .default)
//        navBar.shadowImage = UIImage()
//        if navBar.isHidden == true {
//            print("True")
//
//        }else if navBar.isHidden == false{
//            navBar.isHidden = true
//            print("False")
//        }
//
//        let navItem = UINavigationItem(title: "Галерея");
//        //let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: nil, action: nil);
//        let doneItem = UIBarButtonItem(title: "закрыть", style: .plain, target: navItem, action: nil)
//        navItem.leftBarButtonItem = doneItem;
//
//
//        navBar.setItems([navItem], animated: true);
////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let controller = storyboard.instantiateViewController(withIdentifier: "GalleryNC")
////        self.present(controller, animated: true, completion: nil)
    }
    
    @objc func dismissGalleryVCWithImage(){
        self.dismiss(animated: true, completion: nil)
        print("T##items: Any...##Any")
    }
    @IBAction func dismissGalleryVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
