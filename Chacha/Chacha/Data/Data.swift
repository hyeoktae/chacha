//
//  Data.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation

// network 오류 등등 
enum fail: Error {
  case downloadFail, networkError, noData, uploadFail
}

//var testBeaconData = [beaconInfo]()
//
//func testData() {
//  for i in 0...5 {
//  testBeaconData.append(beaconInfo(uuid: "FDA50693-A4E2-4FB1-AFCF-C6EB07647825", name: "name\(i)", location: "location\(i)"))
//  }
//}
