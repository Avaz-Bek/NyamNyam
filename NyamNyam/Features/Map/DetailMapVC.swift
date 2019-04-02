//
//  DetailMapVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/22/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class DetailMapVC: UIViewController,CLLocationManagerDelegate{
    
    var largeTitle:String?
    private let locationManager = CLLocationManager()
    //private var currentCoordinate: CLLocationCoordinate2D?
    var mapView:GMSMapView?
    var curruntDestination:VacationDestination?
    var destination = VacationDestination(name: "Ktu Manas, Fakul'tet Inzhenerii", latitude: 42.833861, longtitude: 74.576778, location: CLLocationCoordinate2DMake(42.833861, 74.576778))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = largeTitle
        mapView = GMSMapView()
        
        let searchButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchButton.frame = CGRect(x: UIScreen.main.bounds.width/2-30, y: UIScreen.main.bounds.height-UIScreen.main.bounds.height/4, width: 70, height: 70)
        let buttonBounds:CGFloat = searchButton.bounds.size.width
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setTitleColor(UIColor.white, for: .normal)
        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        searchButton.layer.cornerRadius = 0.5 * buttonBounds
        searchButton.layer.masksToBounds = true
        searchButton.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        searchButton.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        
        self.view.addSubview(searchButton)
        
        let camera = GMSCameraPosition.camera(withLatitude: 41.432906, longitude: 74.438459, zoom: 6)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView?.addSubview(searchButton)   
    }
    
    @objc func search(sender:UIButton) {
        
        sender.buttonEffect(sender: sender)
        curruntDestination = destination
        CATransaction.begin()
        CATransaction.setValue(6, forKey: kCATransactionAnimationDuration)
        mapView?.animate(to:GMSCameraPosition.camera(withTarget: (curruntDestination?.location)!, zoom: 15))
        CATransaction.commit()
        
        let marker = GMSMarker(position:curruntDestination!.location)
        marker.title = curruntDestination?.name
        marker.map = mapView
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

extension UIButton{
    func buttonEffect(sender:UIButton) {
        
        let pulsate = CASpringAnimation(keyPath: "transform.scale")
        pulsate.duration = 0.2
        pulsate.repeatCount = 1
        pulsate.autoreverses = true
        pulsate.fromValue = 0.96
        pulsate.toValue = 1.0
        pulsate.autoreverses = true
        pulsate.initialVelocity = 0.5
        pulsate.damping = 1.0
        layer.add(pulsate, forKey: nil)
        
    }
}
