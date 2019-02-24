//
//  RoundedBorderButton.swift
//  versi-app-devlops
//
//  Created by MacBook Pro on 10/02/2019.
//  Copyright © 2019 Walid Sassi. All rights reserved.
//

import UIKit

class RoundedBorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        layer.cornerRadius = frame.height / 3
        layer.borderWidth = 3
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

}
