//
//  MainCVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 2/27/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import UIKit

class LoginVC: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var inputsContainerView:UIView = {
        let view  = UIView()
        view.backgroundColor  = UIColor.white
        view.layer.borderColor =  UIColor.blue.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.clear
        return view
    }()

    var loginRegisterButton:UIButton = {
        let button  = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 53/255, green: 170/255, blue: 102/255, alpha: 1)
        //UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleRegister(){
        
//        if loginRegisterSegmentedControl.selectedSegmentIndex == 2 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainCVC")
//            self.present(vc, animated: true, completion: nil)
//        }
        
    }
    var nameTextField:UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Имя пользователя", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font :UIFont(name: "Arial", size: 13)!])
        tf.textColor = UIColor.white
        tf.tintColor = UIColor.white
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.layer.cornerRadius = 20
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        
        tf.backgroundColor = UIColor.clear
        return tf
    }()
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
//    var nameSeparatorView:UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    var emailTextField:UITextField = {
        let tf = UITextField()
        tf.keyboardType  = .emailAddress
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"example@gmail.com", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font :UIFont(name: "Arial", size: 13)!])
        tf.textColor = UIColor.white
        tf.tintColor = UIColor.white
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.clear
        tf.layer.cornerRadius = 20
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
//    var emailSeparatorView:UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    var passwordTextField:UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"*******", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font :UIFont(name: "Arial", size: 13)!])
        tf.textColor = UIColor.white
        tf.tintColor = UIColor.white
        tf.keyboardType = .asciiCapable
        tf.layer.cornerRadius = 20
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor.clear
        return tf
    }()
    
    var profileImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.layer.masksToBounds = true
        //imageView.layer.cornerRadius = 75
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    
    let loginRegisterSegmentedControl:UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Войти","Регистрация","Гость"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.layer.cornerRadius = 20
        sc.layer.borderWidth = 0.5
        sc.layer.borderColor = UIColor.blue.cgColor
        sc.layer.masksToBounds = true
        sc.selectedSegmentIndex = 1
        
        // selected option color
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
//        sc.backgroundColor = UIColor(red: 53/255, green: 170/255, blue: 102/255, alpha: 1)
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        
        return sc
        
    }()
    
    @objc func handleLoginRegisterChange(){
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)
        
        //change height of inputContainerView, but how??
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            inputContainerViewHeightAnchor?.constant = 110
            nameTextFieldHeightAnchor?.isActive = false
            nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 0)
            nameTextFieldHeightAnchor?.isActive = true

            emailTextFieldHeightAnchor?.isActive = false
            emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
            emailTextFieldHeightAnchor?.isActive = true

            passwordTextFieldHeightAnchor?.isActive = false
            passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
            passwordTextFieldHeightAnchor?.isActive = true

            
        }
        if loginRegisterSegmentedControl.selectedSegmentIndex == 1{
            inputContainerViewHeightAnchor?.constant = 160
            nameTextFieldHeightAnchor?.isActive = false
            
            nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)

            nameTextFieldHeightAnchor?.isActive = true
            
            emailTextFieldHeightAnchor?.isActive = false
            emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
            emailTextFieldHeightAnchor?.isActive = true
            
            passwordTextFieldHeightAnchor?.isActive = false
            passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
            passwordTextFieldHeightAnchor?.isActive = true
        }
        if loginRegisterSegmentedControl.selectedSegmentIndex == 2{
            inputContainerViewHeightAnchor?.constant = 0
        }
        

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
       // backImageView.transform = CGAffineTransform(scaleX: <#T##CGFloat#>, y: <#T##CGFloat#>)
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        view.addSubview(loginRegisterSegmentedControl)
        
        setupInputContainerView()
        setupLoginRegisterButton()
        setupProfileImageView()
        setupLoginRegisterSegmentController()
    }
    
    var inputContainerViewHeightAnchor:NSLayoutConstraint?
    var nameTextFieldHeightAnchor:NSLayoutConstraint?
    var emailTextFieldHeightAnchor:NSLayoutConstraint?
    var passwordTextFieldHeightAnchor:NSLayoutConstraint?
    var nameSeparatorViewHeightAnchor:NSLayoutConstraint?
    var emailSeparatorViewHeightAnchor:NSLayoutConstraint?
    
    
    func setupProfileImageView(){
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -150).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func setupLoginRegisterButton(){
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor,constant:12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    
    func setupLoginRegisterSegmentController(){
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.topAnchor.constraint(equalTo: profileImageView.bottomAnchor,constant:-50).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor,multiplier:1).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
    }
    
    func setupInputContainerView(){
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: loginRegisterSegmentedControl.bottomAnchor,constant:12).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputContainerViewHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(passwordTextField)
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor,constant:5).isActive = true
            nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
            nameTextFieldHeightAnchor?.isActive = true
        
        
        
//            nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
//            nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
//            nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//            nameSeparatorViewHeightAnchor = nameSeparatorView.heightAnchor.constraint(equalToConstant:1)
//            nameSeparatorViewHeightAnchor?.isActive = true
        
        
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant:7).isActive = true
            emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
            emailTextFieldHeightAnchor?.isActive = true
        
        
//            emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
//            emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
//            emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//            emailSeparatorViewHeightAnchor = emailSeparatorView.heightAnchor.constraint(equalToConstant:1)
//            emailSeparatorViewHeightAnchor?.isActive = true
        
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant:5).isActive = true
            passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
            passwordTextFieldHeightAnchor?.isActive = true
        

    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    

}
