//
//  SendMoneyViewController.swift
//  crypto-wallet-app
//
//  Created by Hackintoshi9 on 2019-12-20.
//  Copyright © 2019 sam0sab0y. All rights reserved.
//

import UIKit


class SendMoneyViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.addTarget(self, action: #selector(self.cancel), for: .touchUpInside)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
}
