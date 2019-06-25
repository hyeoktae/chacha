//
//  AppDelegate.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var locationManager = CLLocationManager()
  let uuid = UUID(uuidString: "FDA50693-A4E2-4FB1-AFCF-C6EB07647825")!
  lazy var beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "iBeacon")
  
  private var myUUID = UserDefaults.standard.string(forKey: "uuid")
  
  var window: UIWindow?
  private let mainVC = MainVC()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    checkUUID()
    setupBeacon()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainVC
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
    
    
    return true
  }
  
  private func setupBeacon() {
    locationManager = CLLocationManager.init()
    // locationManager 초기화.
    locationManager.delegate = self
    // 델리게이트 넣어줌.
    locationManager.requestAlwaysAuthorization()
    // 위치 권한 받아옴.
    locationManager.startUpdatingLocation()
    // 위치 업데이트 시작
    locationManager.allowsBackgroundLocationUpdates = true
    // 백그라운드에서도 위치를 체크할 것인지에 대한 여부. 필요없으면 false로 처리하자.
    locationManager.pausesLocationUpdatesAutomatically = false
    // 이걸 써줘야 백그라운드에서 멈추지 않고 돈다
  }
  
  private func checkUUID() {
    let baseUUID = UserDefaults.standard.string(forKey: "uuid")
    
    if baseUUID == nil { //학생등록X -> 이름 & 스쿨 & 우리집 등록(map) 화면
//      myUUID = UUID.init().uuidString
//      UserDefaults.standard.set(uuid, forKey: "uuid")
      print("최초생성한 UUID: ", myUUID)
      
    } else {
      print("생성된 UUID", myUUID)
    }
  }
}

