//
//  FireBase.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import Foundation
import Firebase


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
  
  func test() {
    
  }
  
}
