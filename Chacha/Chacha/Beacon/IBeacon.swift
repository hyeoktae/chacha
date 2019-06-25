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

extension MainVC: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedAlways {
      monitorBeacons()
    } else {
      // 현재 위치가 항상 허용이 아니라면 설정으로 이동해서 항상허용으로 바꾸게 유도해야함
    }
  }
  
  func monitorBeacons() {
    if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
      beaconRegion.notifyEntryStateOnDisplay = true
      beaconRegion.notifyOnExit = true
      beaconRegion.notifyOnEntry = true
      locationManager.startMonitoring(for: beaconRegion)
    } else {
      // 현재 디바이스가 비콘을 모니터링 불가능할 경우
      print("CLLoacation Monitoring is unavailable")
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
    
    guard beaconRegion.proximityUUID == uuid else { return }
    
    if state == .inside {
      // 비콘의 탐지 범위 내
      locationManager.startRangingBeacons(in: beaconRegion)
    } else if state == .outside {
      // 비콘의 탐지 범위 외
      locationManager.stopRangingBeacons(in: beaconRegion)
    } else if state == .unknown {
      // 알수 없는 오류
      print("Now unknown of Region")
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
    print("run")
    for beacon in beacons {
      if beacon.proximityUUID == uuid {
        switch beacon.proximity {
        case .immediate:
          // 매우 근접
          ()
        case .near:
          // 근접
          locationManager.stopRangingBeacons(in: beaconRegion)
        case .far:
          // 멀어짐
          ()
        case .unknown:
          // 탐지 불가
          ()
        @unknown default:
          // 예상외 오류
          ()
        }
      }
    }
  }
}
