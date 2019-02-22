//
//  ViewController.swift
//  NyamNyam
//
//  Created by Atay Sultangaziev on 2/20/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    var sidebarView: SidebarView!
    var blackScreen: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        view?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        
        let btnMenu = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x"), style: .plain, target: self, action: #selector(btnMenuAction))
        //btnMenu.tintColor = UIColor(red: 54/255, green: 55/255, blue: 56/255, alpha: 1.0)
        btnMenu.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = btnMenu
        
        sidebarView=SidebarView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height))
        sidebarView.delegate = self as SidebarViewDelegate
        sidebarView.layer.zPosition = 100
        self.view.isUserInteractionEnabled = true
        self.navigationController?.view.addSubview(sidebarView)
        
        blackScreen=UIView(frame: self.view.bounds)
        blackScreen.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackScreen.isHidden = true
        self.navigationController?.view.addSubview(blackScreen)
        blackScreen.layer.zPosition = 99
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
        blackScreen.addGestureRecognizer(tapGestRecognizer)
        
        
    }
    
    @objc func btnMenuAction() {
        blackScreen.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.sidebarView.frame = CGRect(x: 0, y: 0, width: 250, height: self.sidebarView.frame.height)
        }) { (complete) in
            self.blackScreen.frame=CGRect(x: self.sidebarView.frame.width, y: 0, width: self.view.frame.width-self.sidebarView.frame.width, height: self.view.bounds.height+100)
        }
    }
    
    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
        blackScreen.isHidden = true
        blackScreen.frame = self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sidebarView.frame = CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
        }
    }


}


extension StartViewController: SidebarViewDelegate {
    func sidebarDidSelectRow(row: Row) {
        blackScreen.isHidden = true
        blackScreen.frame = self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
        }
        switch row {
        case .editProfile:
            print("Изменить профиль")
        case .menu:
            print("Меню")
        case .contact:
            print("Контакты")
        case .client_map:
            print("Карта клиента")
        case .our_network:
            print("Наша сеть")
        case .reservation:
            print("Заказ столика")
        case .call:
            print("Позвонить")
        case .stock:
            print("Акции")
        case .signOut:
            print("Войти")
        case .none:
            break
            //        default:  //Default will never be executed
            //            break
        }
    }
}
