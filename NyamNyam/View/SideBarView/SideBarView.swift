//
//  SideBarView.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 2/21/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import UIKit

protocol SidebarViewDelegate: class {
    func sidebarDidSelectRow(row: Row)
}

enum Row: String {
    case editProfile
    case menu
    case contact
    case client_map
    case our_network
    case reservation
    case call
    case stock
    case signOut
    case none
    
    init(row: Int) {
        switch row {
        case 0: self = .editProfile
        case 1: self = .menu
        case 2: self = .contact
        case 3: self = .client_map
        case 4: self = .our_network
        case 5: self = .reservation
        case 6: self = .call
        case 7: self = .stock
        case 8: self = .signOut
        default: self = .none
        }
    }
}

class SidebarView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var titleArr = [String]()
    
    weak var delegate: SidebarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor=UIColor(red: 51/255, green: 58/255, blue: 149/255, alpha: 1.0)
        self.backgroundColor=UIColor.clear
        self.clipsToBounds=true
        
        titleArr = ["Анна", "Меню", "Контакты", "Карта клиента", "Наша сеть", "Заказ столика", "Позвонить","Акции","Войти","О нас"]
        
        setupViews()
        
        myTableView.delegate=self
        myTableView.dataSource=self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.tableFooterView=UIView()
        myTableView.allowsSelection = true
        myTableView.bounces = false
        myTableView.showsVerticalScrollIndicator = false
        myTableView.backgroundColor = UIColor.white
        
        self.myTableView.register(UINib(nibName: "SideBarTableViewCell", bundle: nil), forCellReuseIdentifier: "SideBarTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "SideBarTableViewCell", for: indexPath) as! SideBarTableViewCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            //cell.backgroundColor=UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1.0)
            cell.backgroundColor=UIColor.clear
            let cellImg: UIImageView!
            cellImg = UIImageView(frame: CGRect(x: 15, y: 10, width: 80, height: 80))
            cellImg.layer.cornerRadius = 40
            cellImg.layer.masksToBounds = true
            cellImg.contentMode = .scaleAspectFill
            cellImg.layer.masksToBounds = true
            cellImg.image = #imageLiteral(resourceName: "user.jpeg")
            cell.addSubview(cellImg)
            
            let cellLbl = UILabel(frame: CGRect(x: 110, y: cell.frame.height/2-15, width: 250, height: 30))
            cell.addSubview(cellLbl)
            cellLbl.text = titleArr[indexPath.row]
            cellLbl.font=UIFont.systemFont(ofSize: 25)
            cellLbl.textColor=UIColor.black
        } else {
            cell.nameLabel.text = titleArr[indexPath.row]
            cell.backgroundColor = UIColor.clear
            cell.nameLabel.textColor=UIColor.black
            cell.sideImageView.image = #imageLiteral(resourceName: "user.jpeg")
            cell.sideImageView.layer.cornerRadius = 10
            cell.sideImageView.layer.masksToBounds = true
            cell.sideImageView.contentMode = .scaleAspectFill
            cell.sideImageView.layer.masksToBounds = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.sidebarDidSelectRow(row: Row(row: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
            return 60
        }
    }
    
    func setupViews() {
        self.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        myTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        myTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        myTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    
    let myTableView: UITableView = {
        let table=UITableView()
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
