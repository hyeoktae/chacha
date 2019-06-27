//
//  FireBase.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import Firebase
import CoreLocation


final class Firebase {
  static let shared = Firebase()
  
  private var db: Firestore!
  private let settings = FirestoreSettings()
  
  // Firebase 초기화
  func firebaseInitialize() {
    FirebaseApp.configure()
    Firestore.firestore().settings = settings
    db = Firestore.firestore()
  }
  
  // Student 추가
  func addStudent(name: String, uuid: String, home: String?, school: String ) {
    let docRef = db.collection("students").document(uuid)
    
    db.collection("student").document(uuid).setData([
      "name": name,
      "uuid": uuid,
      "school": school
    ]) { err in
      if let err = err {
        print("Error writing document: \(err)")
      } else {
        print("Document successfully written!")
      }
    }
    
  }
  
  // 비콘 추가 3단 비동기 토나와 ㅅㅂ 더좋은 방법이 있을꺼야 찾아보던가
  func addBeacons(_ beacons: [beaconInfo]?, completion: @escaping (Result<Bool, fail>) -> ()) {
    guard let beacons = beacons else {completion(.failure(.noData)); return }
    let name = beacons.map { $0.name }
    let location = beacons.map { $0.location }
    let uuid = beacons.map { $0.uuid }
    
    self.db.collection("beacon").document("uuid").setData(["uuid" : uuid], completion: { (error) in
      guard error == nil else { completion(.failure(.uploadFail)); return }
      
      self.db.collection("beacon").document("name").setData(["name" : name], completion: { (error) in
        guard error == nil else { completion(.failure(.uploadFail)); return }
        
        self.db.collection("beacon").document("location").setData(["location" : location], completion: { (error) in
          guard error == nil else { completion(.failure(.uploadFail)); return }
          completion(.success(true))
        })
      })
    })
  }
  
  // 파베에 있는 데이터 긁어오기 파싱하는것 처럼 하면되는데
  // 더 좋은 방법이 있을껀데... 난 모르거쑴
  func getBeacons(completion: @escaping (Result<Bool, fail>) -> ()) {
    var uuid = [String]()
    var name = [String]()
    var location = [String]()
    var downloadBeacons = [beaconInfo]()
    
    self.db.collection("beacon").getDocuments { (snap, err) in
      guard err == nil else { return completion(.failure(.networkError)) }
      guard let documents = snap?.documents else { return completion(.failure(.downloadFail)) }
      
      
      for document in documents {
        if let inUUID = document.data()["uuid"] as? [String] {
          uuid = inUUID
        }
        if let inName = document.data()["name"] as? [String] {
          name = inName
        }
        if let inLocation = document.data()["location"] as? [String] {
          location = inLocation
        }
      }
      
      guard uuid.count != 0 else { return completion(.failure(.noData)) }
      
      print("uuid: ", uuid)
      print("location: ", location)
      print("name: ", name)
      
      for idx in 0 ..< uuid.count {
        downloadBeacons.append(beaconInfo(uuid: uuid[idx], name: name[idx], location: location[idx]))
      }
      
      IBeacon.shared.downloadBeacons = downloadBeacons
      
      completion(.success(true))
    }
  }
  
}
