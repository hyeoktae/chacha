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
  
  // Beacon & location properties
  
  var locationManager = CLLocationManager()
  let uuid = UUID(uuidString: "FDA50693-A4E2-4FB1-AFCF-C6EB07647825")!
  lazy var beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "iBeacon")
  var baseUUID: String? {
    return UserDefaults.standard.string(forKey: "uuid")
  }
  
  var window: UIWindow?
  let mainVC = MainVC()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Firebase.shared.firebaseInitialize()
    checkUUID()
    setupBeacon()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainVC
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
    
    return true
  }
  
  // app이 active상태가 될 때 마다 setupBeacon을 실행하며, 위치권한 확인
  func applicationDidBecomeActive(_ application: UIApplication) {
    checkUUID()
    setupBeacon()
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
  
  // Userdefault에 uuid 값 유무 체크
  private func checkUUID() {
    guard baseUUID != nil else { return }
    mainVC.myUUID = baseUUID
  }
  
  // 위치에 관한 권한이 always가 아닐경우 설정으로 묻지도 따지지도않고 바로이동
  // always가 아닐경우 아무고또 모타징~~~
  func moveToSetting() {
    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
  }
  
}

