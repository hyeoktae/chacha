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
  
  let db = Firestore.firestore()
  
  // Firebase 초기화
  func firebaseInitialize() {
    FirebaseApp.configure()
  }
  
  func test() {
    
  }
  
}
