//
//  MainVC.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class MainVC: UIViewController {
  
  var myUUID: String?
  
  let registerVC = RegisterVC()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
  }
  
//  private func checkUUID() {
//    let baseUUID = UserDefaults.standard.string(forKey: "uuid")
//
//    if baseUUID == nil { //학생등록X -> 이름 & 스쿨 & 우리집 등록(map) 화면
//      myUUID = UUID.init().uuidString
//      UserDefaults.standard.set(uuid, forKey: "uuid")
//      print("최초생성한 UUID: ", myUUID)
//
//      present(RegisterVC(), animated: true)
//
//    } else {
//      print("생성된 UUID", myUUID)
//    }
//  }
  
}

