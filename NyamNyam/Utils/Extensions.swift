//
//  Extensions.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/2/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

//MARK: - dataValidetion
extension Date{
    
    static func calculateDate(day:Int,month:Int,year:Int,hour:Int,minute:Int,second:Int) -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let calculateData = formatter.date(from: "\(year)/\(month)/\(day)/\(hour):/\(minute)")
        return calculateData!
    }
    
    func getDayMonthYearHourMinuteSecond() -> (day:Int,month:Int,year:Int,hour:Int,minute:Int,second:Int) {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        
        return (day,month,year,hour,minute,second)
    }
}


//MARK: - errors
extension NSError {
    
    convenience init(message:String?, code: Int = 200) {
        
        let errorMessage = message != nil ? message : NSLocalizedString("Ошибка", comment: "")
        
        let userInfo: [String : Any] =
            [
                NSLocalizedDescriptionKey as String : errorMessage as Any
        ]
        
        self.init(domain: "",code: code, userInfo: userInfo)
    }
}


// MARK - textFieldEffects
//MARK: - button efects
extension UITextField{
    func pulsate(sender:UITextField) {
        
        let pulsate = CASpringAnimation(keyPath: "transform.scale")
        pulsate.duration = 0.0
        pulsate.repeatCount = 0
        pulsate.autoreverses = false
        pulsate.fromValue = 0.96
        pulsate.toValue = 0.99
        pulsate.autoreverses = false
        pulsate.initialVelocity = 0
        pulsate.damping = 0
        layer.add(pulsate, forKey: nil)
        
    }
    
    
    func shake(sender:UITextField) {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
        
    }
    
    func flash(sender:UITextField) {
        
        UIView.animate(withDuration: 0.3, animations: {
            sender.alpha = 1
            sender.backgroundColor = UIColor.orange
        }, completion: { completed in
            if completed {
                UIView.animate(withDuration: 0.3, animations: {
                    sender.backgroundColor = UIColor.clear
                }, completion: { completed in
                    if completed {
                    }
                })
            }
        })
        
    }
    
    
}

//MARK: - button efects
extension UIButton{
    func pulsate(sender:UIButton) {
        
        let pulsate = CASpringAnimation(keyPath: "transform.scale")
        pulsate.duration = 0.0
        pulsate.repeatCount = 0
        pulsate.autoreverses = false
        pulsate.fromValue = 0.96
        pulsate.toValue = 0.99
        pulsate.autoreverses = false
        pulsate.initialVelocity = 0
        pulsate.damping = 0
        layer.add(pulsate, forKey: nil)
        
    }
    
    
    func shake(sender:UIButton) {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
        
    }
    
    func flash(sender:UIButton) {
        
        UIView.animate(withDuration: 0.3, animations: {
            sender.alpha = 1
            sender.backgroundColor = UIColor.orange
        }, completion: { completed in
            if completed {
                UIView.animate(withDuration: 0.3, animations: {
                    sender.backgroundColor = UIColor.clear
                }, completion: { completed in
                    if completed {
                    }
                })
            }
        })
        
    }
    
    
}



//MARK: - custom frame border
extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: thickness)
            
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.bounds.height - thickness,  width: UIScreen.main.bounds.width, height: thickness)
            
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0,  width: thickness, height: self.bounds.height)
            
        case UIRectEdge.right:
            border.frame = CGRect(x: self.bounds.width - thickness, y: 0,  width: thickness, height: self.bounds.height)
        default:
            break
        }
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
}

//MARK: - emailAndPassword validation
extension String{
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidPassword(testStr:String) -> Bool {
        let passwordRegEx = "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
        
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: testStr)
    }
    
    func isValidUsername(testStr:String) -> Bool {
        let usernameRegEx = "^([a-z]+[0-9]*[_.-]?[a-z0-9])"
        
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", usernameRegEx)
        return usernameTest.evaluate(with: testStr)
    }
    
}

//MARK: - callNumberValidation
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
