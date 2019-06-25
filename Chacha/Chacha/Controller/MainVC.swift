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

final class MainVC: UIViewController {
  // private 안됨 appdelegate에서 사용
  var myUUID: String?
  
  private let registerVC = RegisterVC()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstRunApp()
    
  }
  
  // appdelegate 에서 넘어오는 uuid값의 유무 확인 후 nil이면 present
  private func firstRunApp() {
    guard myUUID == nil else { return }
    present(registerVC, animated: true)
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

