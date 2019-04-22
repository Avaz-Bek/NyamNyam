//
//  MainCVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 2/27/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import MMProgressHUD

class LoginVC: UIViewController ,UITextFieldDelegate{
    
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    // MARK: - ProfileImageView
//    var profileImageView:UIImageView = {
//
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "")
//        imageView.backgroundColor = UIColor.red
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//
////        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
//
//        //imageView.addGestureRecognizer(tapGestureRecognizer)
//        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(taped)))
//        imageView.isUserInteractionEnabled = true
//        return imageView
//    }()
    
    
    // MARK: - UISigmentedController
    let loginRegisterGuestSegmentedControl:UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Войти","Регистрация","Гость"])
        sc.tintColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.layer.cornerRadius = 20
        sc.layer.borderWidth = 0.5
        sc.layer.borderColor = UIColor.orange.cgColor
        sc.layer.masksToBounds = true
        sc.selectedSegmentIndex = 1
        // selected option color
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        sc.addTarget(self, action: #selector(handleLoginRegisterGuestChange), for: .valueChanged)
        
        return sc
        
    }()
    
    
    // MARK: - inputContainerView
    var inputsContainerView:UIView = {
        let view  = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    
    // MARK: - NameTextField
    var nameTextField:UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Имя пользователя", attributes:[NSAttributedString.Key.foregroundColor: UIColor.orange,NSAttributedString.Key.font :UIFont(name: "Arial", size: 13)!])
        tf.textColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        tf.tintColor = UIColor.orange
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.layer.cornerRadius = 20
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.orange.cgColor
        tf.backgroundColor = UIColor.clear
        return tf
    }()
    
    // MARK: - EmailTextField
    var emailTextField:UITextField = {
        let tf = UITextField()
        
        tf.keyboardType  = .emailAddress
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"example@gmail.com", attributes:[NSAttributedString.Key.foregroundColor: UIColor.orange,NSAttributedString.Key.font :UIFont(name: "Arial", size: 13)!])
        tf.textColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        tf.tintColor = UIColor.orange
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.clear
        tf.layer.cornerRadius = 20
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.orange.cgColor
        return tf
    }()
    
    
    // MARK: - PasswordTextField
    var passwordTextField:UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"*******", attributes:[NSAttributedString.Key.foregroundColor: UIColor.orange,NSAttributedString.Key.font :UIFont(name: "Arial", size: 13)!])
        tf.textColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        tf.tintColor = UIColor.orange
        tf.keyboardType = .asciiCapable
        tf.layer.cornerRadius = 20
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.orange.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor.clear
        return tf
    }()
    
    
    // MARK: - LoginRegisterGuestButton
    var loginRegisterGuestButton:UIButton = {
        let button  = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: Anchors for fields
    var inputContainerViewHeightAnchor:NSLayoutConstraint?
    var nameTextFieldHeightAnchor:NSLayoutConstraint?
    var emailTextFieldHeightAnchor:NSLayoutConstraint?
    var passwordTextFieldHeightAnchor:NSLayoutConstraint?
    
    
    
    
    // MARK: - textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    var userVM : LoginVM?
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterGuestButton)
       // view.addSubview(profileImageView)
        view.addSubview(loginRegisterGuestSegmentedControl)
        
        setupInputContainerView()
        setupLoginRegisterButton()
        //setupProfileImageView()
        setupLoginRegisterGuestSegmentController()
        //profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector()))
        profileImageView.isUserInteractionEnabled = true
    }
    
    
    // MARK: - register for loginRegisterGuestButton
    @objc func handleRegister(sender:UIButton){
        
        if loginRegisterGuestSegmentedControl.selectedSegmentIndex == 0 {
            
            
            
            guard let email = emailTextField.text, emailTextField.text?.count != 0  else {
                MMProgressHUD.show()
                MMProgressHUD.dismissWithError("Введите адрес почты")
                loginRegisterGuestButton.shake(sender: sender)
                return
            }
            
            guard let password = passwordTextField.text, passwordTextField.text?.count != 0  else {
                MMProgressHUD.show()
                MMProgressHUD.dismissWithError("Введите пароль")
                loginRegisterGuestButton.shake(sender: sender)
                return
            }
            
            if email.isValidEmail(testStr: email) == false{
                MMProgressHUD.show()
                MMProgressHUD.dismissWithError("Адрес почты неправильно")
                emailTextField.shake(sender: emailTextField)
                //loginRegisterGuestButton.shake(sender: loginRegisterGuestButton)
            }else if password.isValidPassword(testStr: password) == false{
                MMProgressHUD.show()
                MMProgressHUD.dismissWithError("Пароль должен содержать не менее 6 символов и цифры", afterDelay: 2)
                passwordTextField.shake(sender: passwordTextField)
                //loginRegisterGuestButton.shake(sender: sender)
            }else{
                
                
                
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
                    
                    MMProgressHUD.show(withTitle: "Авторизация", status: "", image: UIImage(named: ""))
                    
                    if error == nil && user != nil{
                        
                        MMProgressHUD.dismiss(withSuccess: "Успешна")
                        
                        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil) as UIStoryboard
                        let tabBarVC = mainStoryboard.instantiateViewController(withIdentifier: "tabBarVC") as! TabBarVC
                        
                        self?.present(tabBarVC, animated: true, completion: nil)
                        return
                    }else{
                        
                        MMProgressHUD.dismissWithError("Не успешна")
                    }
                    
                }
                
                loginRegisterGuestButton.pulsate(sender: sender)
                
            }
            
        } else if loginRegisterGuestSegmentedControl.selectedSegmentIndex == 1 {
            
            guard let username = nameTextField.text, nameTextField.text?.count != 0  else {
                MMProgressHUD.show()
                MMProgressHUD.dismissWithError("Введите имя пользователя")
                loginRegisterGuestButton.shake(sender: sender)
                return
            }
            
            guard let email = emailTextField.text, emailTextField.text?.count != 0  else {
                MMProgressHUD.show()
                MMProgressHUD.dismissWithError("Введите адрес почты")
                loginRegisterGuestButton.shake(sender: sender)
                return
            }
            
            guard let password = passwordTextField.text, passwordTextField.text?.count != 0  else {
                MMProgressHUD.show()
                MMProgressHUD.dismissWithError("Введите пароль")
                loginRegisterGuestButton.shake(sender: sender)
                return
            }
            
            if username.isValidUsername(testStr: username){
                MMProgressHUD.show()
                MMProgressHUD.dismissWithError("Пароль должен содержать не менее 6 символов и цифры", afterDelay: 2)
                loginRegisterGuestButton.shake(sender: loginRegisterGuestButton)
            }else if email.isValidEmail(testStr: email) == false{
                MMProgressHUD.dismissWithError("Адрес почты неправильно")
                loginRegisterGuestButton.shake(sender: loginRegisterGuestButton)
            }else if password.isValidPassword(testStr: password) == false{
                MMProgressHUD.show()
                MMProgressHUD.dismissWithError("Пароль должен содержать не менее 6 символов и цифры", afterDelay: 2)
                loginRegisterGuestButton.shake(sender: sender)
            }else{
                loginRegisterGuestButton.pulsate(sender: sender)
                
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    
                    MMProgressHUD.show(withTitle: "Регистрация", status: "", image: UIImage(named: ""))
                    
                    if error == nil && authResult != nil{
                        MMProgressHUD.dismiss(withSuccess: "Успешна")
                        FIRFirestoreService.shared.reference(to: .user).document(FIRFirestoreService.shared.getUserID()).setData([
                            "username": username,
                            "email": email,
                        ]) { err in
                            
                            if err != nil {
                                
                            } else {
                                
                                
                            }
                            
                        }
                        
                        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
                            
                            guard let strongSelf = self else { return }
                            
                            if error == nil && user != nil{
                                
                                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil) as UIStoryboard
                                let tabBarVC = mainStoryboard.instantiateViewController(withIdentifier: "tabBarVC") as! TabBarVC
                                
                                self?.present(tabBarVC, animated: true, completion: nil)
                                return
                            }else{
                                
                            }
                            
                        }
                    }else{
                        MMProgressHUD.dismissWithError("Не успешна")
                    }
                    
                }
                
                
            }
            
        }else if loginRegisterGuestSegmentedControl.selectedSegmentIndex == 2 {
            loginRegisterGuestButton.pulsate(sender: loginRegisterGuestButton)
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
            self.present(vc!, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - setup Functions
    @objc func handleLoginRegisterGuestChange(){
        
        let title = loginRegisterGuestSegmentedControl.titleForSegment(at: loginRegisterGuestSegmentedControl.selectedSegmentIndex)
        loginRegisterGuestButton.setTitle(title, for: .normal)
        
        //change height of inputContainerView
        if loginRegisterGuestSegmentedControl.selectedSegmentIndex == 0 {
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
            
            
        }else if loginRegisterGuestSegmentedControl.selectedSegmentIndex == 1{
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
        }else if loginRegisterGuestSegmentedControl.selectedSegmentIndex == 2{
            inputContainerViewHeightAnchor?.constant = 0
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
    

    
    func setupProfileImageView(){
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -150).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    
    func setupLoginRegisterButton(){
        loginRegisterGuestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterGuestButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor,constant:12).isActive = true
        loginRegisterGuestButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterGuestButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    func setupLoginRegisterGuestSegmentController(){
        loginRegisterGuestSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterGuestSegmentedControl.topAnchor.constraint(equalTo: profileImageView.bottomAnchor,constant:8).isActive = true
        loginRegisterGuestSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor,multiplier:1).isActive = true
        loginRegisterGuestSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
    }
    
    
    func setupInputContainerView(){
        
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: loginRegisterGuestSegmentedControl.bottomAnchor,constant:12).isActive = true
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
        
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant:7).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
        emailTextFieldHeightAnchor?.isActive = true
        
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
