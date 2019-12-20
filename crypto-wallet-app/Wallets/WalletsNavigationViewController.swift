//
//  WalletsNavigationViewController.swift
//  crypto-wallet-app
//
//  Created by Hackintoshi9 on 2019-12-18.
//  Copyright © 2019 sam0sab0y. All rights reserved.
//

import UIKit

class WalletsNavigationViewController: UINavigationController {
    let BalanceButton:UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Balance"
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = nil
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.shadowImage = UIImage()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
