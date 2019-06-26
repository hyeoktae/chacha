//
//  RegisterVC.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
  
  let registerView = RegisterView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
<<<<<<< HEAD
    
=======
>>>>>>> 8e34908bcda161a1c04abd54ad40a6e7c9a2ea1a
    registerView.delegate = self
    setupRegisterView()
    
  }
  
  private func setupRegisterView() {
    view.addSubview(registerView)
    let guide = view.safeAreaLayoutGuide
    registerView.translatesAutoresizingMaskIntoConstraints = false
    registerView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    registerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    registerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    registerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
}

extension RegisterVC: RegisterViewDelegate {
<<<<<<< HEAD
  // student 등록 / enrollButton 클릭
  func registerStudent() {
    print("didTapEnrollButtonDelegate")
=======
  // student 등록 / enroll btn 클릭
  func registerStudent() {
    print("didTapEnrollBtnDelegate")
>>>>>>> 8e34908bcda161a1c04abd54ad40a6e7c9a2ea1a
  }
}
