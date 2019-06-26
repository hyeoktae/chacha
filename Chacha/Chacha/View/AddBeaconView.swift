//
//  AddBeaconView.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/26.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

protocol AddBeaconViewDelegate: class {
  func submit(_ indexRow: Int)
}

class AddBeaconView: UIView {
  
  var delegate: AddBeaconViewDelegate?
  
  private lazy var beaconTblView: UITableView = {
    let tbl = UITableView()
    tbl.translatesAutoresizingMaskIntoConstraints = false
    tbl.register(UITableViewCell.self, forCellReuseIdentifier: "beaconCell")
    tbl.dataSource = self
    tbl.delegate = self
    return tbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(beaconTblView)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let guide = self.safeAreaLayoutGuide
    
    beaconTblView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    beaconTblView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    beaconTblView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    beaconTblView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension AddBeaconView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return IBeacon.shared.newBeacons?.count ?? 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "beaconCell", for: indexPath)
    cell.textLabel?.text = IBeacon.shared.newBeacons?[indexPath.row].proximityUUID.uuidString
    cell.detailTextLabel?.text = String(describing: IBeacon.shared.newBeacons?[indexPath.row].proximity)
    return cell
  }
  
}

extension AddBeaconView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    delegate?.submit(indexPath.row)
  }
}
