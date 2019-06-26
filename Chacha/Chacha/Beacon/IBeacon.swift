//
//  IBeacon.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import CoreLocation
import CoreBluetooth

struct beaconInfo {
  var uuid: String
  var name: String
  var location: String
}

// beacon에 대한 data
final class IBeacon {
  static let shared = IBeacon()
  
  var nearBeacons: [CLBeacon]?
  var newBeacons = [CLBeacon]()
  var downloadBeacons = [beaconInfo]()
  var uploadBeacons = [beaconInfo]()
  
  func compareBeacons() {
    
    newBeacons = []
    guard nearBeacons != nil else { return }
    guard !downloadBeacons.isEmpty else {
      newBeacons = nearBeacons!
      return
    }
    
    print("compare 에서 newBeacons: ve", newBeacons)
    print("compare 에서 nearBeacons: ve", nearBeacons)
    print("compare 에서 downloadBeacons: ve", downloadBeacons)
    
    for nearBeacon in nearBeacons! {
      var count = 0
      for downloadBeacon in downloadBeacons {
        if nearBeacon.proximityUUID.uuidString == downloadBeacon.uuid {
          count += 1
        }
      }
      if count == 0 {
        newBeacons.append(nearBeacon)
      }
    }
    
    print("compare 에서 newBeacons: ", newBeacons)
    print("compare 에서 nearBeacons: ", nearBeacons)
    print("compare 에서 downloadBeacons: ", downloadBeacons)
    
  }
  
  func readyToUpdateBeacon(index: Int?, name: String, location: String) {
    guard let idx = index else { return }
    print("업데이트 전에 downloadBeacons: ", downloadBeacons)
    print("업데이트 전에 uploadBeacons: ", uploadBeacons)
    print("업데이트 전에 newBeacons: : ", newBeacons)
    
    
    self.uploadBeacons = self.downloadBeacons
    let newUUID = newBeacons[idx].proximityUUID.uuidString
    
    uploadBeacons.append(beaconInfo(uuid: newUUID, name: name, location: location))
    
  }
  
}

extension AppDelegate: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    print("check location state")
    if status == .authorizedAlways {
      monitorBeacons()
    } else {
      // 현재 위치가 항상 허용이 아니라면 설정으로 이동해서 항상허용으로 바꾸게 유도해야함
      moveToSetting()
    }
  }
  
  func monitorBeacons() {
    if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
//      print("monitorBeacons Run before", beaconRegion)
      beaconRegion.notifyEntryStateOnDisplay = true
      beaconRegion.notifyOnExit = true
      beaconRegion.notifyOnEntry = true
      locationManager.startMonitoring(for: beaconRegion)
//      print("monitorBeacons Run", beaconRegion)
    } else {
      // 현재 디바이스가 비콘을 모니터링 불가능할 경우
      print("CLLoacation Monitoring is unavailable")
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
    print("비콘 탐지 시작")
    guard beaconRegion.proximityUUID == uuid else { return }
    
    if state == .inside {
      // 비콘의 탐지 범위 내
      locationManager.startRangingBeacons(in: beaconRegion)
      // 아래에 출첵 시키면 됨
      ()
    } else if state == .outside {
      // 비콘의 탐지 범위 외
      locationManager.stopRangingBeacons(in: beaconRegion)
    } else if state == .unknown {
      // 알수 없는 오류
      print("Now unknown of Region")
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
    IBeacon.shared.nearBeacons = beacons
//    print("@@@비콘의 범위 탐지함@@@", IBeacon.shared.nearBeacons)
//    for beacon in beacons {
//      if beacon.proximityUUID == uuid {
//        switch beacon.proximity {
//        case .immediate:
//          // 매우 근접
//          ()
//        case .near:
//          // 근접
//          ()
//        case .far:
//          // 멀어짐
//          ()
//        case .unknown:
//          // 탐지 불가
//          ()
//        @unknown default:
//          // 예상외 오류
//          ()
//        }
//      }
//    }
  }
  
  
}
