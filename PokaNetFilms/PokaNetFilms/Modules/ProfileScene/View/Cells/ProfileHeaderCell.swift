//
//  ProfileHeaderView.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 18.11.2023.
//

import Foundation
import UIKit

final class ProfileHeaderCell: UICollectionViewCell, UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    
    // MARK: - Properties
    private var profileImage = UIImageView()
    private var profileEmail = UILabel()
    private var profileName = UILabel()
    private let settingsButton = UIButton()
    weak var delegate: ProfileHeaderCellDelegate?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.layer.masksToBounds = true
    }
}

//MARK: - SetupUI
private extension ProfileHeaderCell {
    func setupUI() {
        backgroundColor = .white
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds,
                                      byRoundingCorners: [.bottomLeft, .bottomRight],
                                      cornerRadii: CGSize(width: 50, height: 50)).cgPath
        layer.mask = maskLayer
        
        setupSettingsButton()
        setupProfileEmail()
        setupProfileName()
        setupProfileImage()
    }
    
    func setupSettingsButton(){
        addSubview(settingsButton)
        
        let pencilImageName = "pencil"
        let symbolPointSize: CGFloat = 23
        let buttonColor = UIColor.systemBlue

        if let originalImage = UIImage(systemName: pencilImageName) {
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: symbolPointSize)
            let symbolImage = originalImage.withConfiguration(symbolConfiguration)
            
            settingsButton.setImage(symbolImage, for: .normal)
            settingsButton.tintColor = buttonColor
        }
        
        settingsButton.setTitle(" Редактировать", for: .normal)
        settingsButton.setTitleColor(.systemBlue, for: .normal)
        settingsButton.backgroundColor = .white
        settingsButton.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        makeConstraintsSettingsButton()
    }
    
    func makeConstraintsSettingsButton() {
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -55),
            settingsButton.leftAnchor.constraint(equalTo: leftAnchor),
            settingsButton.rightAnchor.constraint(equalTo: rightAnchor),
            settingsButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func openSettings(_ sender: UIButton) {
        print("Я открыл настройки)))")
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        
        let alertController = UIAlertController(title: "Редактировать профиль", message: "Пожалуйста, отредактируйте свое имя, почтовый адрес и фото", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите ваше имя"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите ваш почтовый адрес"
            textField.keyboardType = .emailAddress
        }
        
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { [self] action in
            if let name = alertController.textFields?[0].text, let email = alertController.textFields?[1].text {
                UserDefaults.standard.set(name, forKey: "nameKey")
                UserDefaults.standard.set(email, forKey: "emailKey")
                profileName.text = name
                profileEmail.text = email
            }
        }
        
        
        let swapPhotoAction = UIAlertAction(title: "Поменять фото", style: .default) { [self] action in
            if let name = alertController.textFields?[0].text, let email = alertController.textFields?[1].text {
                UserDefaults.standard.set(name, forKey: "nameKey")
                UserDefaults.standard.set(email, forKey: "emailKey")
                profileName.text = name
                profileEmail.text = email
                
                delegate?.presentImagePicker(vc)
                
            }
        }
        
        alertController.addAction(swapPhotoAction)
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        delegate?.presentAlert(alertController)
    }
    
    
    
    func setupProfileEmail() {
        addSubview(profileEmail)
        
        profileEmail.textAlignment = .center
        profileEmail.textColor = .systemGray2
        
        makeConstraintProfileEmail()
    }
    
    func makeConstraintProfileEmail() {
        profileEmail.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileEmail.bottomAnchor.constraint(equalTo: settingsButton.topAnchor),
            profileEmail.leftAnchor.constraint(equalTo: leftAnchor),
            profileEmail.rightAnchor.constraint(equalTo: rightAnchor),
            profileEmail.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupProfileName() {
        addSubview(profileName)
        
        profileName.textAlignment = .center
        profileName.textColor = .black
        profileName.font = UIFont.systemFont(ofSize: 30)
        
        makeConstraintProfileName()
    }
    
    func makeConstraintProfileName() {
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileName.bottomAnchor.constraint(equalTo: profileEmail.topAnchor),
            profileName.leftAnchor.constraint(equalTo: leftAnchor),
            profileName.rightAnchor.constraint(equalTo: rightAnchor),
            profileName.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupProfileImage() {
        addSubview(profileImage)
        let fileManager = FileManager.default
        var savedImage: UIImage?
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("savedImage.png")
            if fileManager.fileExists(atPath: fileURL.path) {
                if let imageData = try? Data(contentsOf: fileURL) {
                    savedImage = UIImage(data: imageData)
                }
            }
        }
        profileImage.image = savedImage ?? UIImage(systemName: "person.crop.circle")// устанавливаем изображение
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.layer.masksToBounds = true
        
        makeConstraintProfileImage()
    }
    
    func makeConstraintProfileImage() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileImage.bottomAnchor.constraint(equalTo: profileName.topAnchor, constant: -5),
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor)
        ])
    }
}

extension ProfileHeaderCell {
    func configure(_ header: ProfileHeaderModel) {
//        profileImage.image = header.avatar
        profileName.text = header.userName
        profileEmail.text = header.email
    }
}

extension ProfileHeaderCell {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImage.image = image
            
            guard let image = profileImage.image,
                  let data = image.pngData() else {
                return
            }

            let fileManager = FileManager.default
            if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentsDirectory.appendingPathComponent("savedImage.png")
                do {
                    try data.write(to: fileURL)
                } catch {
                    print("Error saving image: \(error)")
                }
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


protocol ProfileHeaderCellDelegate: AnyObject {
    func presentImagePicker(_ picker: UIImagePickerController)
    
    func presentAlert(_ alert: UIAlertController)
}


extension ProfileViewController: ProfileHeaderCellDelegate {
    func presentAlert(_ alertController: UIAlertController) {
        present(alertController, animated: true, completion: nil)
    }
    
    func presentImagePicker(_ picker: UIImagePickerController) {
        present(picker, animated: true, completion: nil)
    }
}
