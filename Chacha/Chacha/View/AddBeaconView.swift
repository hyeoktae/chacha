//
//  AddBeaconView.swift
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

protocol AddBeaconViewDelegate: class {
  func submit(_ indexRow: Int)
}

class AddBeaconView: UIView {
  
<<<<<<< HEAD
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
=======
<<<<<<< HEAD
  override init(frame: CGRect) {
    super.init(frame: frame)
>>>>>>> 3610a6c7ddc1355fcb4ed900ca25f35a7b81fffe
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
<<<<<<< HEAD
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
=======

=======
>>>>>>> 8e34908bcda161a1c04abd54ad40a6e7c9a2ea1a
>>>>>>> 3610a6c7ddc1355fcb4ed900ca25f35a7b81fffe
}
