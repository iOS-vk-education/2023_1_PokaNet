//
//  AuthorizationSceneViewController.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 21.11.2023.
//

import Foundation
import UIKit

final class AuthorizationViewController: UIViewController {
    
    private let output: AuthorizationViewOutput
    private let labelEnter = UILabel()
    private let imagePK = UIImageView()
    private let mailTextField = UITextField()
    private let enterButton = UIButton()
    private let labelOr = UILabel()
    private let vkButton = AuthorizationImageButton()
    private let regButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(#function)
        view.backgroundColor = .white
        
        setupImagePK()
        setupLabelEnter()
        setupMailTextField()
        setupEnterButton()
        setupLableOr()
        setupVkButton()
        setupRegButton()
        
    }
    
    init(output: AuthorizationViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImagePK() {
        self.view.addSubview(imagePK)
        imagePK.clipsToBounds = true
        imagePK.contentMode = .scaleAspectFill
        imagePK.image = UIImage(named: "PNImage")
        imagePK.sizeToFit()
        imagePK.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePK.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            imagePK.widthAnchor.constraint(equalToConstant: 60),
            imagePK.heightAnchor.constraint(equalToConstant: 60),
            imagePK.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupLabelEnter() {
        view.addSubview(labelEnter)
        labelEnter.text = "Вход POKA NET"
        labelEnter.font = UIFont.systemFont(ofSize: 30)
        labelEnter.textAlignment = .center
        labelEnter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelEnter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelEnter.leftAnchor.constraint(equalTo: view.leftAnchor),
            labelEnter.rightAnchor.constraint(equalTo: view.rightAnchor),
            labelEnter.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 400)
        ])
    }
    
    func setupMailTextField() {
        self.view.addSubview(mailTextField)
        mailTextField.placeholder = " Введите mail"
        mailTextField.textColor = .gray
        mailTextField.font = UIFont.systemFont(ofSize: 20)
        mailTextField.layer.cornerRadius = 10
        mailTextField.backgroundColor = .placeholderText
        mailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 280),
            mailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            mailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            mailTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 325)
            
        ])
    }
    
    func setupEnterButton() {
        self.view.addSubview(enterButton)
        enterButton.setTitle("Войти", for: .normal)
        enterButton.layer.cornerRadius = 10
        enterButton.backgroundColor = UIColor(red: 0.00, green: 0.46, blue: 0.95, alpha: 1.00)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterButton.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 20),
            enterButton.bottomAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 65),
            enterButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            enterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)

        ])
        
    }
    
    func setupLableOr() {
        self.view.addSubview(labelOr)
        labelOr.text = "или"
        labelOr.textColor = .gray
        labelOr.font = UIFont.systemFont(ofSize: 20)
        labelOr.textAlignment = .center
        labelOr.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelOr.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 25),
            labelOr.bottomAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 45),
            labelOr.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150),
            labelOr.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150)
        ])
    }
    
    func setupVkButton() {
        self.view.addSubview(vkButton)
        vkButton.configure(icon: "VKImage", title: "Войти через VK")
        vkButton.layer.cornerRadius = 10
        vkButton.backgroundColor = .clear
        vkButton.layer.borderWidth = 1
        vkButton.layer.borderColor = UIColor.gray.cgColor
        vkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vkButton.topAnchor.constraint(equalTo: labelOr.bottomAnchor, constant: 20),
            vkButton.bottomAnchor.constraint(equalTo: labelOr.bottomAnchor, constant: 65),
            vkButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            vkButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        ])
    }
    
    func setupRegButton() {
        self.view.addSubview(regButton)
        regButton.setTitle("Зарегистироваться", for: .normal)
        regButton.layer.cornerRadius = 10
        regButton.backgroundColor = UIColor(red: 0.33, green: 0.78, blue: 0.30, alpha: 1.00)
        regButton.translatesAutoresizingMaskIntoConstraints = false
        regButton.addTarget(self, action: #selector(regButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            regButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -145),
            regButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            regButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            regButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)

        ])
    }
}

//MARK: - Coordination
private extension AuthorizationViewController {
    @objc func regButtonTapped() {
        output.didTapRegistrationButton()
    }
}

extension AuthorizationViewController: AuthorizationViewInput {
    
}



