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
  
  // Beacon / location properties
  var locationManager = CLLocationManager()
  let uuid = UUID(uuidString: "FDA50693-A4E2-4FB1-AFCF-C6EB07647825")!
  lazy var beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "iBeacon")
  private var baseUUID = UserDefaults.standard.string(forKey: "uuid")
  
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
  
  // Userdefault에 uuid 값 유무 체크
  private func checkUUID() {
    guard baseUUID != nil else { return }
    mainVC.myUUID = baseUUID
  }
}

