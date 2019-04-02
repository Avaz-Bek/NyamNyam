//
//  OrderVC.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/25/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit

class ReservationCVC: UIViewController,UITextFieldDelegate{
    
    
    //    MARK: - properties
    
    var countOfPeople = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    var addressOfRestourants = ["Bishkek","Osh","Naryn","Talas","Chuy","Issyk Kul","Djalal Abad"]
    
    //    MARK: - nametextfield
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
    var countOfPeopleTextField:UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.frame = CGRect(x: 16, y: 0, width: 375, height: 31)
        let tfBounds:CGFloat = tf.bounds.size.height
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Количество людей", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font :UIFont(name: "Georgia", size: 12)!])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 0.3 * tfBounds
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor.white
        return tf
    }()
    
    //    MARK: - dataTextField
    var dataTextField:UITextField = {
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 375, height: 31)
        let tfBounds:CGFloat = tf.bounds.size.height
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Дата", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font :UIFont(name: "Georgia", size: 12)!])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.textColor = UIColor.white
        tf.layer.cornerRadius = 0.3 * tfBounds
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 0.8)
        return tf
    }()

    
    //    MARK: - timeTextField
    var timeTextField:UITextField = {
        let tf = UITextField()
        tf.frame = CGRect(x: 150, y: 0, width: 375, height: 31)
        let tfBounds:CGFloat = tf.bounds.size.height
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Время", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font :UIFont(name: "Georgia", size: 12)!])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = UIColor.white
        tf.keyboardType = .default
        tf.layer.cornerRadius = 0.3 * tfBounds
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor(red: 253/255, green: 92/255, blue: 1/255, alpha: 0.8)
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
    
    //    MARK: - addresOfRestourant
    var addresTextField:UITextField = {
        let tf = UITextField()
        tf.frame = CGRect(x: 16, y: 0, width: 375, height: 31)
        let tfBounds:CGFloat = tf.bounds.size.height
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string:"Выберите адрес ресторана", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font :UIFont(name: "Georgia", size: 12)!])
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.layer.cornerRadius = 0.3 * tfBounds
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor.white
        return tf
    }()
    
    //    MARK: - deliveryMethod
    var sendButton:UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 0, width: 375, height: 48)
        let buttonBounds:CGFloat = button.bounds.size.width/6
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
    
    //    MARK: - pickerViews
    
    //    MARK: - deliverMethodPickerView
    var countOfPeoplePickerView:UIPickerView = {
        let view = UIPickerView()
        
        return view
    }()
    //    MARK: - paymentMethodPickerView
    var dataPickerView:UIDatePicker = {
        let view = UIDatePicker()
        return view
    }()
    
    //    MARK: - timeDeliverPickerView
    var timePickerView:UIDatePicker = {
        let view = UIDatePicker()
        return view
    }()
    
    //    MARK: - timeDeliverPickerView
    var addressPickerView:UIPickerView = {
        let view = UIPickerView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Заказ столика"
        
        setupAllComponents()
        setupAllDelegates()
        setupAllInputViews()
        
    }
    
    func setupAllInputViews() {
        
        countOfPeopleTextField.inputView = countOfPeoplePickerView
        dataTextField.inputView = dataPickerView
        timeTextField.inputView = timePickerView
        addresTextField.inputView = addressPickerView
        
        dataPickerView.addTarget(self, action: #selector(didTappedDate), for: UIControl.Event.allEvents)
        timePickerView.addTarget(self, action: #selector(didTappedTime), for: UIControl.Event.allEvents)
    }
    
    @objc func didTappedDate(){
        dataTextField.text = "\(dataPickerView.date.getDayMonthYearHourMinuteSecond().month)/\(dataPickerView.date.getDayMonthYearHourMinuteSecond().day)/\(dataPickerView.date.getDayMonthYearHourMinuteSecond().year)"
    }
    @objc func didTappedTime(){
        timeTextField.text = "\(timePickerView.date.getDayMonthYearHourMinuteSecond().hour):\(timePickerView.date.getDayMonthYearHourMinuteSecond().minute)"
    }
    
    func setupAllDelegates() {
        
        countOfPeoplePickerView.delegate = self
        addressPickerView.delegate = self
        
        nameTextField.delegate = self
        numberTextField.delegate = self
        countOfPeopleTextField.delegate = self
        commentTextField.delegate = self
        addresTextField.delegate = self
    }
    
    func setupAllComponents(){
        setupNameTextField()
        setupNumberTextField()
        setupCountOfPepleTextField()
        setupDataTextField()
        setupTimeTextField()
        setupCommentTextField()
        setupAddressTextField()
        setupSendButton()
    }
    func setupNameTextField(){
        view.addSubview(nameTextField)
        
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height/13).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -32).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/10).isActive = true
    }
    
    func  setupNumberTextField() {
        view.addSubview(numberTextField)
        
        numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: view.frame.height/25).isActive = true
        numberTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -32).isActive = true
        numberTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/10).isActive = true
    }
    
    
    func setupCountOfPepleTextField(){
        view.addSubview(countOfPeopleTextField)
        
        countOfPeopleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countOfPeopleTextField.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: view.frame.height/25).isActive = true
        countOfPeopleTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -32).isActive = true
        countOfPeopleTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/10).isActive = true
    }
    
    func setupDataTextField() {
        dataPickerView.datePickerMode = .date
        view.addSubview(dataTextField)
        
        dataTextField.leftAnchor.constraint(equalTo: countOfPeopleTextField.leftAnchor,constant: 16).isActive = true
        //dataTextField.rightAnchor.constraint(equalTo: timeTextField.leftAnchor, constant: 32)
        //dataTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dataTextField.topAnchor.constraint(equalTo: countOfPeopleTextField.bottomAnchor,constant:view.frame.height/20).isActive = true
        dataTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -view.frame.width/2 - 48).isActive = true
        dataTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/10).isActive = true
    }
    
    func setupTimeTextField() {
        timePickerView.datePickerMode = .time
        view.addSubview(timeTextField)
        
        timeTextField.leftAnchor.constraint(equalTo: dataTextField.rightAnchor,constant: 32).isActive = true
        timeTextField.rightAnchor.constraint(equalTo: countOfPeopleTextField.rightAnchor,constant: -16  )
        timeTextField.topAnchor.constraint(equalTo: dataTextField.topAnchor).isActive = true
        timeTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -view.frame.width/2 - 48).isActive = true
        timeTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/10).isActive = true
    }
    
    func setupCommentTextField() {
        view.addSubview(commentTextField)
        
        commentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        commentTextField.topAnchor.constraint(equalTo: timeTextField.bottomAnchor, constant: view.frame.height/20).isActive = true
        commentTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -32).isActive = true
        commentTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/10).isActive = true
    }
    
    func setupAddressTextField(){
        view.addSubview(addresTextField)
        
        addresTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addresTextField.topAnchor.constraint(equalTo: commentTextField.bottomAnchor,constant:view.frame.height/25).isActive = true
        addresTextField.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -32).isActive = true
        addresTextField.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/10).isActive = true
    }
    
    func setupSendButton() {
        view.addSubview(sendButton)
        
        sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant:-(view.frame.height/10)).isActive = true
        sendButton.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -64).isActive = true
        sendButton.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1/9).isActive = true
    }
    
    @objc func handlePayButton(sender:UIButton){
        sender.payButtonEffect(sender: sender)
    }
    
    
    @IBAction func dismissButton(_ sender: UIButton) {
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

extension ReservationCVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var countRows:Int = countOfPeople.count
        
        if pickerView == addressPickerView {
            countRows = self.addressOfRestourants.count
        }
        return countRows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countOfPeoplePickerView {
            let titleRow = countOfPeople[row]
            return titleRow
        }else if pickerView == addressPickerView {
            let title = addressOfRestourants[row]
            return title
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == countOfPeoplePickerView {
            self.countOfPeopleTextField.text = self.countOfPeople[row]
        }else if pickerView == addressPickerView{
            self.addresTextField.text = self.addressOfRestourants[row]
        }
    }
    
    
}
