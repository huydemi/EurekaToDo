//
//  ToDoCategoryRow.swift
//  EurekaToDo
//
//  Created by Dang Quoc Huy on 7/25/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import Foundation
import Eureka

class ToDoCategoryCell: PushSelectorCell<String> {
  
  lazy var categoryLabel: UILabel = {
    let lbl = UILabel()
    lbl.textAlignment = .center
    return lbl
  }()
  
  override func setup() {
    height = { 60 }
    row.title = nil
    super.setup()
    selectionStyle = .none
    
    contentView.addSubview(categoryLabel)
    categoryLabel.translatesAutoresizingMaskIntoConstraints = false
    let margin: CGFloat = 10.0
    categoryLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -(margin * 2)).isActive = true
    categoryLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -(margin * 2)).isActive = true
    categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
  }
  
  override func update() {
    row.title = nil
    accessoryType = .disclosureIndicator
    editingAccessoryType = accessoryType
    selectionStyle = row.isDisabled ? .none : .default
    categoryLabel.text = row.value
  }
}

final class ToDoCategoryRow: _PushRow<ToDoCategoryCell>, RowType { }
