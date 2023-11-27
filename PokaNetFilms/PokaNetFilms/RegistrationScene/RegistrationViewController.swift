//
//  RegistrationViewController.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 26.11.2023.
//

import Foundation
import UIKit

final class RegistrationViewController: UIViewController {
    
    private let output: RegistrationViewOutput
    
    private let imagePK = UIImageView()
    private let labelReg = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
        view.backgroundColor = .white
        
        setupImagePK()
        setupLabelReg()
    }
    
    init(output: RegistrationViewOutput) {
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
//        imagePK.frame = CGRect(x: 165, y: 140, width: 60, height: 60)
        imagePK.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePK.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
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
        labelReg.translatesAutoresizingMaskIntoConstraints = false // для активации верстки кодом
        NSLayoutConstraint.activate([
            labelReg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelReg.leftAnchor.constraint(equalTo: view.leftAnchor),
            labelReg.rightAnchor.constraint(equalTo: view.rightAnchor),
            labelReg.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 400)
        ])
    }
}

extension RegistrationViewController: RegistrationViewInput {
    
}

