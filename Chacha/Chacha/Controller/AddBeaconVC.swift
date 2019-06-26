//
//  AddBeaconVC.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/26.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class AddBeaconVC: UIViewController {
  
  private let addBeaconView = AddBeaconView(frame: UIScreen.main.bounds)
  private let addBeaconDetailVC = AddBeaconDetailVC()

    override func viewDidLoad() {
        super.viewDidLoad()
      Firebase.shared.getBeacons {
        switch $0 {
        case .failure(let err):
          IBeacon.shared.downloadBeacons = []
          print(err.localizedDescription)
        case .success(_):
          print("addBeaconVC after getBeacons: ", IBeacon.shared.downloadBeacons)
        }
        IBeacon.shared.compareBeacons()
        DispatchQueue.main.async {
          self.addBeaconView.tblViewReload()
        }
      }
      addBeaconView.delegate = self
      view.addSubview(addBeaconView)
    }
  
}

extension AddBeaconVC: AddBeaconViewDelegate {
  func popVC() {
    dismiss(animated: true)
  }
  
  func reload() {
    Firebase.shared.getBeacons {
      switch $0 {
      case .failure(let err):
        IBeacon.shared.downloadBeacons = []
        print(err.localizedDescription)
      case .success(_):
        print("addBeaconVC after getBeacons: ", IBeacon.shared.downloadBeacons)
//        print("download Beacons: ", IBeacon.shared.downloadBeacons)
//        print("near Beacons: ", IBeacon.shared.nearBeacons)
//        print("new Beacons: ", IBeacon.shared.newBeacons)
//        print("run Reload Btn")
      }
      
      IBeacon.shared.compareBeacons()
      DispatchQueue.main.async {
        self.addBeaconView.tblViewReload()
      }
    }
    
  }
  
  func selectedCell(_ indexRow: Int) {
//    print("click")
    addBeaconDetailVC.indexRow = indexRow
    addBeaconDetailVC.modalPresentationStyle = .overCurrentContext
    present(addBeaconDetailVC, animated: true)
  }
}
