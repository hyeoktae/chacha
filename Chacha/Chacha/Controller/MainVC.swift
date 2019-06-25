//
//  MainVC.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit


class MainVC: UIViewController {
  
  var uuid = UserDefaults.standard.string(forKey: "uuid")
  
  let registerVC = RegisterVC()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    checkUUID()
  }
  
  private func checkUUID() {
    let baseUUID = UserDefaults.standard.string(forKey: "uuid")
    
    if baseUUID == nil { //학생등록X -> 이름 & 스쿨 & 우리집 등록(map) 화면
      uuid = UUID.init().uuidString
      UserDefaults.standard.set(uuid, forKey: "uuid")
      print("최초생성한 UUID: ", uuid)
      
      present(RegisterVC(), animated: true)
      
    } else {
      print("생성된 UUID", uuid)
    }
    
  }
  
  
  
  
  
}

