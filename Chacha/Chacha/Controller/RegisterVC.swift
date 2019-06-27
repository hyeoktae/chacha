//
//  RegisterVC.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
  
  let registerView: RegisterView = {
    let view = RegisterView()
    view.enrollButton.addTarget(self, action: #selector(enrollButtonDidTapped), for: .touchUpInside)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let shared = Firebase.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerView.delegate = self
    setupRegisterView()
    
  }
  
  private func setupRegisterView() {
    view.addSubview(registerView)
    
    let guide = view.safeAreaLayoutGuide
    registerView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    registerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    registerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    registerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
  @objc private func enrollButtonDidTapped() {
    let mainVC = MainVC()
    if registerView.nameTextField.text!.isEmpty {
      // nameTextField 비어 있을 경우
      
    } else if registerView.schoolTextField.text!.isEmpty {
      // schoolTextField 비어 있을 경우
      
    } else if registerView.addressTextField.text!.isEmpty {
      // addressTextField 비어 있을 경우
      
    } else {
      present(mainVC, animated: true)
    }
  }
  
}

extension RegisterVC: RegisterViewDelegate {
  // student 등록 / enroll btn 클릭
  func registerStudent() {
    print("didTapEnrollBtnDelegate")
//    shared.addStudent(name: registerView.nameTextField, uuid: uuid, home: registerView.home, school: registerView.schoolTextField)
    // 나중에 이부분 수정해야함 현재는 임의로 dismiss
    dismiss(animated: true)
  }
}
