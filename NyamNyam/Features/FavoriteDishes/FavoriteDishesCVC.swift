//
//  AboutFoodCVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/13/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import UIKit

class FavoriteDishesCVC: UICollectionViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var imageNameArray:[String] = []
    
    var array = ["150","140","340","213","245","345","65"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Любимые"
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        registerXib()
    }
    
    func registerXib(){
        collectionView.register(FavoriteDishesVCCell.nib, forCellWithReuseIdentifier: FavoriteDishesVCCell.identifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(imageNameArray.count)
        return imageNameArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteDishesVCCell.identifier, for: indexPath) as! FavoriteDishesVCCell
        cell.delegate = self
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius  = 10
        
        
        //cell.aboutFoodImage.layer.masksToBounds = true
        //cell.aboutFoodImage.layer.cornerRadius = 10
        
        cell.foodName.text = imageNameArray[indexPath.row]
        
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
        
        cell.weightLabel.text = imageNameArray[indexPath.row] + "гр"
        
        
        cell.orderButton.layer.masksToBounds = true
        cell.orderButton.layer.borderWidth = 0.5
        cell.orderButton.layer.borderColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1).cgColor
        cell.orderButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: UIControl.State.normal)
        cell.orderButton.layer.cornerRadius = cell.orderButton.frame.height/3
        
        cell.orderButton.setTitle( "100c", for: UIControl.State.normal)
        cell.orderButton.titleLabel?.textColor = UIColor.white
        cell.orderButton.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        
        cell.foodImage.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell
    }
    
}


extension FavoriteDishesCVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 140)
    }
}


extension FavoriteDishesCVC: FavoriteDishesDelegate{
    
    func didTapOrderButton(_ btn: UIButton) {
        btn.payButtonEffect(sender: btn)
        
        let alert = UIAlertController(title: "Хотите заказать?", message: "Нажав на кнопку Заказать, вы попадёте на страницу для заполнения обязательных полей", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Отложить", style: UIAlertAction.Style.cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Заказать", style: UIAlertAction.Style.default, handler: { (action) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func didTapHeartButton(_ btn: UIButton) {
        
        if btn.tag == 0 {
            showToast(controller: self,title: "Поздравляем!" ,message: "Вы успешно добавили в Любимые!", time: 1,color: UIColor.green.cgColor)
            btn.setImage(UIImage(named: "heart-cencel"), for: UIControl.State.normal)
            btn.tag += 1
        }else if btn.tag == 1{
            showToast(controller: self,title: "Упс!", message: "Вы случайно удалили из Любимые!", time: 1,color: UIColor.red.cgColor)
            btn.setImage(UIImage(named: "heart-ok"), for: UIControl.State.normal)
            btn.tag -= 1
        }
        
    }
    
    
    func showToast(controller:UIViewController,title:String,message:String,time:Double,color:CGColor) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.layer.cornerRadius = 15
        alert.view.layer.masksToBounds = true
        alert.view.layer.borderWidth = 1
        alert.view.layer.borderColor = color
        self.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time){
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    
    //    func didTapOrderButton(_ sender: FoodsVCCell, _ btn: UIButton) {
    //        print("BB")
    //        btn.orderButtonEffect(sender: btn)
    //
    //        let alert = UIAlertController(title: "Хотите ли вы заказать?", message: "Нажав на кнопку Заказать, вы попадёте на страницу для заполнения обязательных полей", preferredStyle: UIAlertController.Style.alert)
    //
    //        alert.addAction(UIAlertAction(title: "", style: UIAlertAction.Style.cancel, handler: { (action) in
    //            alert.dismiss(animated: true, completion: nil)
    //            print("Отложить на потом")
    //        }))
    //
    //        alert.addAction(UIAlertAction(title: "Заказать", style: UIAlertAction.Style.default, handler: { (action) in
    //            print("Заказать")
    //        }))
    //
    //        self.present(alert, animated: true, completion: nil)
    //    }
    
    
}


extension FavoriteDishesCVC:UISearchBarDelegate{
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
