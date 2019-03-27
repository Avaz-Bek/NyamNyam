//
//  OrderVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/25/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class OrderVC: UIViewController,UITextFieldDelegate{
    
    //MARK: - nametextfield
    var nameTextField:UITextField = {
        let tf = UITextField()
        tf.frame = CGRect(x: 16, y: 32, width: 375, height: 31)
        let tfBounds:CGFloat = tf.bounds.size.height
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Ваше имя", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font :UIFont(name: "Georgia", size: 12)!])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.layer.cornerRadius = 0.3 * tfBounds
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor.white
        return tf
    }()
    
    
    //    MARK: - surnametextfiled
    var numberTextField:UITextField = {
        let tf = UITextField()
        tf.frame = CGRect(x: 16, y: 0, width: 375, height: 31)
        let tfBounds:CGFloat = tf.bounds.size.height
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Номер телефона", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font :UIFont(name: "Georgia", size: 12)!])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.layer.cornerRadius = 0.3 * tfBounds
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor.white
        return tf
    }()
    
    //    MARK: - addrestextfiled
    var addressTextField:UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.frame = CGRect(x: 16, y: 0, width: 375, height: 31)
        let tfBounds:CGFloat = tf.bounds.size.height
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Ваш адрес", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font :UIFont(name: "Georgia", size: 12)!])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.layer.cornerRadius = 0.3 * tfBounds
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor.white
        return tf
    }()
    
    //    MARK: - commentTextField
    var commentTextField:UITextField = {
        let tf = UITextField()
        tf.frame = CGRect(x: 16, y: 0, width: 375, height: 31)
        let tfBounds:CGFloat = tf.bounds.size.height
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Ваш комментарий", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font :UIFont(name: "Georgia", size: 12)!])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.layer.cornerRadius = 0.3 * tfBounds
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor.white
        return tf
    }()
    
    //    MARK: - paymentMethod
    var paymentMethodButton:UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 0, width: 375, height: 30)
        let buttonBounds:CGFloat = button.bounds.size.height
        button.setTitle("Способ оплаты", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 0.3 * buttonBounds
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 0.8)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        button.addTarget(self, action: #selector(handlePayButton), for: .touchUpInside)
        return button
    }()
    
    //    MARK: - deliveryMethod
    var deliveryMethodButton:UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 0, width: 375, height: 30)
        let buttonBounds:CGFloat = button.bounds.size.height
        button.setTitle("Способ доставки", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 0.3 * buttonBounds
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 0.8)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        button.addTarget(self, action: #selector(handlePayButton), for: .touchUpInside)
        return button
    }()
    
    //    MARK: - deliveryMethod
    var timeDeliverButton:UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 0, width: 375, height: 30)
        let buttonBounds:CGFloat = button.bounds.size.height
        button.setTitle("Время доставки", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 0.3 * buttonBounds
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 0.8)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        button.addTarget(self, action: #selector(handlePayButton), for: .touchUpInside)
        return button
    }()
    
    //    MARK: - deliveryMethod
    var sendButton:UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 0, width: 375, height: 30)
        let buttonBounds:CGFloat = button.bounds.size.height
        button.setTitle("Отправить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 0.3 * buttonBounds
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        button.addTarget(self, action: #selector(handlePayButton), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Заказ блюда"
        
        nameTextField.delegate = self
        numberTextField.delegate = self
        addressTextField.delegate = self
        commentTextField.delegate = self
        
        setupNameTextField()
        setupNumberTextField()
        setupPayMethodButton()
        setupDeliverMethodButton()
        setupAddressTextField()
        setupTimeDeliverButton()
        setupCommentTextField()
        setupSendButton()
        
    }
    
    func setupNameTextField(){
        
        view.addSubview(nameTextField)
        
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -32).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/12).isActive = true
    }
    
    func  setupNumberTextField() {
        view.addSubview(numberTextField)
        
        numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16).isActive = true
        numberTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -32).isActive = true
        numberTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/12).isActive = true
    }
    
    func setupPayMethodButton() {
        
        view.addSubview(paymentMethodButton)
        
        paymentMethodButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        paymentMethodButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor,constant:32).isActive = true
        paymentMethodButton.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -64).isActive = true
        paymentMethodButton.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/12).isActive = true
    }
    
    func setupDeliverMethodButton(){
        view.addSubview(deliveryMethodButton)
        
        deliveryMethodButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deliveryMethodButton.topAnchor.constraint(equalTo: paymentMethodButton.bottomAnchor,constant:16).isActive = true
        deliveryMethodButton.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -64).isActive = true
        deliveryMethodButton.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/12).isActive = true
    }
    
    func setupAddressTextField(){
        view.addSubview(addressTextField)
        
        addressTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addressTextField.topAnchor.constraint(equalTo: deliveryMethodButton.bottomAnchor, constant: 32).isActive = true
        addressTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -32).isActive = true
        addressTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/12).isActive = true
    }
    
    func setupTimeDeliverButton() {
        view.addSubview(timeDeliverButton)
        
        timeDeliverButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeDeliverButton.topAnchor.constraint(equalTo: addressTextField.bottomAnchor,constant:32).isActive = true
        timeDeliverButton.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -64).isActive = true
        timeDeliverButton.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/12).isActive = true
    }
    
    func setupCommentTextField() {
        view.addSubview(commentTextField)
        
        commentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        commentTextField.topAnchor.constraint(equalTo: timeDeliverButton.bottomAnchor, constant: 32).isActive = true
        commentTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -32).isActive = true
        commentTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/12).isActive = true
    }
    
    func setupSendButton() {
        view.addSubview(sendButton)
        
        sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant:-32).isActive = true
        sendButton.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -64).isActive = true
        sendButton.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/11).isActive = true
    }
    
    @objc func handlePayButton(sender:UIButton){
        sender.payButtonEffect(sender: sender)
    }
    
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
    func payButtonEffect(sender:UIButton) {
        
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
}
