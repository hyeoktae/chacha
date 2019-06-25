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

<<<<<<< HEAD

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
  
  
  
  
  
=======
class MainVC: UIViewController {
  
  // Beacon Properties
  var locationManager = CLLocationManager()
  let uuid = UUID(uuidString: "FDA50693-A4E2-4FB1-AFCF-C6EB07647825")!
  lazy var beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "iBeacon")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBeacon()
  }
  
  func setupBeacon() {
    locationManager = CLLocationManager.init()              // locationManager 초기화.
    locationManager.delegate = self                         // 델리게이트 넣어줌.
    locationManager.requestAlwaysAuthorization()            // 위치 권한 받아옴.
    
    locationManager.startUpdatingLocation()                 // 위치 업데이트 시작
    locationManager.allowsBackgroundLocationUpdates = true  // 백그라운드에서도 위치를 체크할 것인지에 대한 여부. 필요없으면 false로 처리하자.
    locationManager.pausesLocationUpdatesAutomatically = false  // 이걸 써줘야 백그라운드에서 멈추지 않고 돈다
    
  }
  
>>>>>>> d1ce56fca42062b833fe02d534e71c2e91e11e0b
}

