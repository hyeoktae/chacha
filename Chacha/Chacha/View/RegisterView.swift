//
//  RegisterView.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit


protocol RegisterViewDelegate: class {
  // student 등록 시 실행할 메소드
  func registerStudent()
}

final class RegisterView: UIView {
  
  // MARK: - Properties
  
  var delegate: RegisterViewDelegate?
  
  let topLabel: UILabel = {
    let label = UILabel()
    label.text = "학생등록"
    label.font = UIFont.boldSystemFont(ofSize: 25)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let dismissButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "dismiss"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "이름"
    label.font = UIFont.systemFont(ofSize: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let nameTextField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = #colorLiteral(red: 0.9351945585, green: 0.9444539105, blue: 0.9444539105, alpha: 1)
    textField.placeholder = "이름"
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  let schoolLabel: UILabel = {
    let label = UILabel()
    label.text = "스쿨"
    label.font = UIFont.systemFont(ofSize: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let schoolTextField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = #colorLiteral(red: 0.9351945585, green: 0.9444539105, blue: 0.9444539105, alpha: 1)
    textField.placeholder = "스쿨"
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  let addresslLabel: UILabel = {
    let label = UILabel()
    label.text = "주소"
    label.font = UIFont.systemFont(ofSize: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let addressTextField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = #colorLiteral(red: 0.9351945585, green: 0.9444539105, blue: 0.9444539105, alpha: 1)
    textField.placeholder = "주소"
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  let enrollButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    button.setTitle("등록하기", for: .normal)
    button.tintColor = .white
    button.layer.cornerRadius = 20
    button.addTarget(self, action: #selector(didTapEnrollButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupAutoLayout()
  }
  
  
  private func setupAutoLayout() {
    addSubview(topLabel)
    addSubview(dismissButton)
    
    addSubview(nameLabel)
    addSubview(nameTextField)
    
    addSubview(schoolLabel)
    addSubview(schoolTextField)
    
    addSubview(addresslLabel)
    addSubview(addressTextField)
    
    addSubview(enrollButton)
    
    topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    topLabel.trailingAnchor.constraint(equalTo: dismissButton.leadingAnchor).isActive = true
    topLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    topLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
    dismissButton.centerYAnchor.constraint(equalTo: topLabel.centerYAnchor).isActive = true
    dismissButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    dismissButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
    dismissButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    
    nameLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 10).isActive = true
    nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
    nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 5).isActive = true
    nameTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    schoolLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
    schoolLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    schoolLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    schoolLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    schoolTextField.topAnchor.constraint(equalTo: schoolLabel.bottomAnchor, constant: 5).isActive = true
    schoolTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
    schoolTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    schoolTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    addresslLabel.topAnchor.constraint(equalTo: schoolTextField.bottomAnchor, constant: 10).isActive = true
    addresslLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
    addresslLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    addresslLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    addressTextField.topAnchor.constraint(equalTo: addresslLabel.bottomAnchor, constant: 5).isActive = true
    addressTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
    addressTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    addressTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    enrollButton.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 30).isActive = true
    enrollButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
    enrollButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    enrollButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
  }
  @objc func didTapEnrollButton(_ sender: UIButton) {
    print("didTapEnrollButton")
    delegate?.registerStudent()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
