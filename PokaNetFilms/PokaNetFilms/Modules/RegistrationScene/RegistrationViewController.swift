//
//  RegistrationViewController.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 26.11.2023.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase


final class RegistrationViewController: UIViewController {
    
    private let output: RegistrationViewOutput
    
    private let imagePK = UIImageView()
    private let labelReg = UILabel()
    private let nameTextField = UITextField()
    private let mailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let passConfirmTextField = UITextField()
    private let regButton = UIButton()
    private let accountExist = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        registration()
        print(#function)
        view.backgroundColor = .white
        setupImagePK()
        setupLabelReg()
        setupNameTextField()
        setupMailTextField()
        setupPasswordTextField()
        setupPassConfirmTextField()
        setupRegButton()
        setupExistAccountButton()
        
    }
    
    init(output: RegistrationViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registration() {
        Auth.auth().createUser(withEmail: "mahakoz@icloud.com", password: "password") { AuthDataResult, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print(AuthDataResult?.user.uid ?? "")
            }
        }
    }
    
    
    func setupImagePK() {
        self.view.addSubview(imagePK)
        imagePK.clipsToBounds = true
        imagePK.contentMode = .scaleAspectFill
        imagePK.image = UIImage(named: "PNImage")
        imagePK.layer.cornerRadius = 10
        imagePK.sizeToFit()
        imagePK.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePK.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imagePK.widthAnchor.constraint(equalToConstant: 60),
            imagePK.heightAnchor.constraint(equalToConstant: 60),
            imagePK.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupLabelReg() {
        view.addSubview(labelReg)
        labelReg.text = "Регистрация"
        labelReg.font = UIFont.systemFont(ofSize: 30)
        labelReg.textAlignment = .center
        labelReg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelReg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            labelReg.leftAnchor.constraint(equalTo: view.leftAnchor),
            labelReg.rightAnchor.constraint(equalTo: view.rightAnchor),
            labelReg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250)
        ])
    }
    
    func setupNameTextField() {
        self.view.addSubview(nameTextField)
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        nameTextField.leftViewMode = UITextField.ViewMode.always
        nameTextField.leftView = spacerView
        nameTextField.placeholder = "Ваше имя"
        nameTextField.textColor = .gray
        nameTextField.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 0.30)
        nameTextField.font = UIFont.systemFont(ofSize: 20)
        nameTextField.layer.cornerRadius = 10
        nameTextField.backgroundColor = .placeholderText
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: labelReg.bottomAnchor, constant: 20),
            nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            nameTextField.bottomAnchor.constraint(equalTo: labelReg.bottomAnchor, constant: 65)
            
        ])
    }
    
    func setupMailTextField() {
        self.view.addSubview(mailTextField)
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        mailTextField.leftViewMode = UITextField.ViewMode.always
        mailTextField.leftView = spacerView
        mailTextField.placeholder = "Email"
        mailTextField.textColor = .gray
        mailTextField.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 0.30)
        mailTextField.font = UIFont.systemFont(ofSize: 20)
        mailTextField.layer.cornerRadius = 10
        mailTextField.backgroundColor = .placeholderText
        mailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            mailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            mailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            mailTextField.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 65)
            
        ])
    }
    
    func setupPasswordTextField() {
        self.view.addSubview(passwordTextField)
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        passwordTextField.leftView = spacerView
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Пароль"
        passwordTextField.textColor = .gray
        passwordTextField.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 0.30)
        passwordTextField.font = UIFont.systemFont(ofSize: 20)
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.backgroundColor = .placeholderText
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 20),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            passwordTextField.bottomAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 65)
            
        ])
    }
    
    func setupPassConfirmTextField() {
        self.view.addSubview(passConfirmTextField)
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        passConfirmTextField.leftViewMode = UITextField.ViewMode.always
        passConfirmTextField.leftView = spacerView
        passConfirmTextField.isSecureTextEntry = true
        passConfirmTextField.placeholder = "Подтвердите пароль"
        passConfirmTextField.textColor = .gray
        passConfirmTextField.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 0.30)
        passConfirmTextField.font = UIFont.systemFont(ofSize: 20)
        passConfirmTextField.layer.cornerRadius = 10
        passConfirmTextField.backgroundColor = .placeholderText
        passConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passConfirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            passConfirmTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            passConfirmTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            passConfirmTextField.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 65)
            
        ])
    }
    
    func setupRegButton() {
        self.view.addSubview(regButton)
        regButton.setTitle("Зарегистироваться", for: .normal)
        regButton.layer.cornerRadius = 10
        regButton.backgroundColor = UIColor(red: 0.00, green: 0.47, blue: 1.00, alpha: 0.80)
        regButton.translatesAutoresizingMaskIntoConstraints = false
        regButton.addTarget(self, action: #selector(registButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            regButton.topAnchor.constraint(equalTo: passConfirmTextField.bottomAnchor, constant: 60),
            regButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            regButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            regButton.bottomAnchor.constraint(equalTo: passConfirmTextField.bottomAnchor, constant: 105)
            
            
        ])
    }
    
    func setupExistAccountButton() {
        self.view.addSubview(accountExist)
        accountExist.setTitle("Уже есть аккаунт", for: .normal)
        accountExist.layer.cornerRadius = 10
        accountExist.backgroundColor = UIColor(red: 0.00, green: 0.47, blue: 1.00, alpha: 0.80)
        accountExist.translatesAutoresizingMaskIntoConstraints = false
        accountExist.addTarget(self, action: #selector(accountExistButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            accountExist.topAnchor.constraint(equalTo: regButton.bottomAnchor, constant: 20),
            accountExist.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            accountExist.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            accountExist.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

//MARK: - Coordination
private extension RegistrationViewController {
    @objc func accountExistButtonTapped() {
        output.accountExistButtonTapped()
    }
    
    @objc func registButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty, let email = mailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty, let passconf = passConfirmTextField.text, !passconf.isEmpty
        else {
            AlertManager.showBasicAlert(on: self, title: "Поля не должны быть пустыми", message: "Заполните поля")
            return
        }
        guard password == passconf
        else {
            AlertManager.showBasicAlert(on: self, title: "Введенные пароли не совпадают", message: "Введите одинаковые пароли")
            return
        }
        output.registButtonTapped(name: name, email: email, password: password, passconf: passconf)
    
    }
}

extension RegistrationViewController: RegistrationViewInput {
    func showError() {
        AlertManager.showBasicAlert(on: self, title: "Произошла ошибка", message: "Попробуйте заново")
    }
    
}


