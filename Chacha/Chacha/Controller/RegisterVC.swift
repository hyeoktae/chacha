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
  // student 등록 / enroll btn 클릭
  func registerStudent() {
    print("didTapEnrollBtnDelegate")
    // 나중에 이부분 수정해야함 현재는 임의로 dismiss
    dismiss(animated: true)
  }
}
