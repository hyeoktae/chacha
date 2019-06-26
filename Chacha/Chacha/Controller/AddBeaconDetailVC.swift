//
//  AddBeaconDetailVC.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/26.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

final class AddBeaconDetailVC: UIViewController {
  
  var indexRow: Int? {
    willSet(new) {
      addBeaconDetailView.indexRow = new ?? 0
    }
  }
  
  private let addBeaconDetailView: AddBeaconDetailView = {
    let view = AddBeaconDetailView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addBeaconDetailView.delegate = self
    view.addSubview(addBeaconDetailView)
    setupAutolayout()
  }
  
  private func setupAutolayout() {
    let guide = view.safeAreaLayoutGuide
    
    addBeaconDetailView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    addBeaconDetailView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
    addBeaconDetailView.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.5).isActive = true
    addBeaconDetailView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.5).isActive = true
  }
  
}


extension AddBeaconDetailVC: AddBeaconDetailViewDelegate {
  func submit() {
    presentingViewController?.dismiss(animated: true)
  }
  
  func cancel() {
    presentingViewController?.dismiss(animated: true)
  }
  
  
}
