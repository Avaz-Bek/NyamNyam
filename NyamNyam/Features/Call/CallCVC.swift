//
//  AboutFoodCVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/13/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import UIKit

class CallCVC: UICollectionViewController {
    
    var arrayNumber = ["+996551351351","+996551351351","+996551351351","+996551351351","+996551351351","+996551351351","+996551351352"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXib()
    }
    
    func registerXib(){
        collectionView.register(CallCVCell.nib, forCellWithReuseIdentifier: CallCVCell.identifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayNumber.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CallCVCell.identifier, for: indexPath) as! CallCVCell
        
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius  = 10
    
        cell.number.text = arrayNumber[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 375, height: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        arrayNumber[indexPath.row].makeACall()
    }
    

}


extension CallCVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-16, height: 80)
    }
}

extension String {
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }
    
    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func makeACall() {
        if isValid(regex: .phone) {
            if let url = URL(string: "tel://\(self.onlyDigits())"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
