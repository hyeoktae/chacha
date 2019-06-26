//
//  AddBeaconVC.swift
//  Chacha
//
<<<<<<< HEAD
//  Created by 차수연 on 26/06/2019.
=======
//  Created by hyeoktae kwon on 2019/06/26.
>>>>>>> 8e34908bcda161a1c04abd54ad40a6e7c9a2ea1a
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class AddBeaconVC: UIViewController {
  
  private let addBeaconView = AddBeaconView(frame: UIScreen.main.bounds)
  private let addBeaconDetailVC = AddBeaconDetailVC()

    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
      addBeaconView.delegate = self
      view.addSubview(addBeaconView)
=======
<<<<<<< HEAD

=======
      
>>>>>>> 8e34908bcda161a1c04abd54ad40a6e7c9a2ea1a
>>>>>>> 3610a6c7ddc1355fcb4ed900ca25f35a7b81fffe
    }
  
}

extension AddBeaconVC: AddBeaconViewDelegate {
  func submit(_ indexRow: Int) {
    print("click")
    addBeaconDetailVC.modalPresentationStyle = .overCurrentContext
    present(addBeaconDetailVC, animated: true)
  }
}
