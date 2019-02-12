//
//  PlacesTableViewCell.swift
//  Travelogue
//
//  Created by Joshua Dubey on 30/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit
import BEMCheckBox

class PlacesTableViewCell: UITableViewCell {

    static let identifier = "PlacesTableViewCell"
    var checkbox: BEMCheckBox!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        checkbox = BEMCheckBox(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        if checkbox.superview == nil {
            checkbox.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(checkbox!)
            checkbox.heightAnchor.constraint(equalToConstant: 30).isActive = true
            checkbox.widthAnchor.constraint(equalToConstant: 30).isActive = true
            checkbox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            contentView.trailingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 20).isActive = true
        }
    }
}
