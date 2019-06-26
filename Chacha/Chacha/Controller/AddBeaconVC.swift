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
      addBeaconView.delegate = self
      view.addSubview(addBeaconView)
    }
  
}

extension AddBeaconVC: AddBeaconViewDelegate {
  func submit(_ indexRow: Int) {
    print("click")
    addBeaconDetailVC.modalPresentationStyle = .overCurrentContext
    present(addBeaconDetailVC, animated: true)
  }
}
