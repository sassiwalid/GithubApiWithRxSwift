
//  RoundedBorderTextField.swift
//  versi-app-devlops
//
//  Created by MacBook Pro on 10/02/2019.
//  Copyright © 2019 Walid Sassi. All rights reserved.
//

import UIKit

class RoundedBorderTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0.2967869064, green: 0.4779323029, blue: 1, alpha: 1)])
        attributedPlaceholder = placeholder
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = frame.height / 2
        layer.borderColor = #colorLiteral(red: 0.09556539699, green: 0.5561906694, blue: 1, alpha: 1)
        layer.borderWidth = 3
    }

}
