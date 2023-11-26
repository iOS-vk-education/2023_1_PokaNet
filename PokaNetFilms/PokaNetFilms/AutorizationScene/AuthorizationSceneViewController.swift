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
    private let firebaseButon = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(#function)
        view.backgroundColor = .white
        
        setupImagePK()
        setupLabelEnter()
        setupMailTextField()
        setupEnterButton()
        setupLableOr()
//        setupFirebaseButton()
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
        imagePK.frame = CGRect(x: 165, y: 140, width: 60, height: 60)
    }
    
    func setupLabelEnter() {
        view.addSubview(labelEnter)
        labelEnter.text = "Вход POKA NET"
        labelEnter.font = UIFont.systemFont(ofSize: 30)
        labelEnter.textAlignment = .center
        labelEnter.translatesAutoresizingMaskIntoConstraints = false // для активации верстки кодом
        NSLayoutConstraint.activate([
            labelEnter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelEnter.leftAnchor.constraint(equalTo: view.leftAnchor),
            labelEnter.rightAnchor.constraint(equalTo: view.rightAnchor),
            labelEnter.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 400)
        ])
    }
    
    func setupMailTextField() {
        self.view.addSubview(mailTextField)
        mailTextField.text = "  Введите email"
//        mailTextField.placeholder = " Введите mail"
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
    
//    func setupFirebaseButton() {
//        self.view.addSubview(firebaseButon)
//        firebaseButon.setTitle("Войти через Firebase", for: .normal)
//        firebaseButon.layer.cornerRadius = 10
//        firebaseButon.backgroundColor = .lightGray
//        firebaseButon.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            firebaseButon.topAnchor.constraint(equalTo: labelOr.bottomAnchor, constant: 20),
//            firebaseButon.bottomAnchor.constraint(equalTo: labelOr.bottomAnchor, constant: 65),
//            firebaseButon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
//            firebaseButon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
//
//        ])
//    }
    
}

extension AuthorizationViewController: AuthorizationViewInput {
    
}



