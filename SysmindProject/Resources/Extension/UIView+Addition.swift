//
//  UIView+Addition.swift
//  SysmindProject
//
//  Created by Mohd Maruf on 10/12/20.
//  Copyright © 2020 Deepam. All rights reserved.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension UITableView {
    
    // Function to set message in bold
    func setEmptyMessageInBold(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        messageLabel.text = message
        messageLabel.textColor = .red
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        self.separatorStyle = .none
        self.backgroundView = messageLabel
    }
    
    // to nil the TableView background view
    func restore() {
        self.backgroundView = nil
    }
}
