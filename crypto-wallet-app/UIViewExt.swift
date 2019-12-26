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
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
      if #available(iOS 11.0, *) {
        return self.safeAreaLayoutGuide.topAnchor
      }
      return self.topAnchor
    }

    var safeLeftAnchor: NSLayoutXAxisAnchor {
      if #available(iOS 11.0, *){
        return self.safeAreaLayoutGuide.leftAnchor
      }
      return self.leftAnchor
    }

    var safeRightAnchor: NSLayoutXAxisAnchor {
      if #available(iOS 11.0, *){
        return self.safeAreaLayoutGuide.rightAnchor
      }
      return self.rightAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
      if #available(iOS 11.0, *) {
        return self.safeAreaLayoutGuide.bottomAnchor
      }
      return self.bottomAnchor
    }
}
