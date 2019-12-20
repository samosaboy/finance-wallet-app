//
//  UIViewExt.swift
//  crypto-wallet-app
//
//  Created by Hackintoshi9 on 2019-12-19.
//  Copyright © 2019 sam0sab0y. All rights reserved.
//

import UIKit

extension UIView {
    func addTapGesture(tapNumber: Int, target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
}
