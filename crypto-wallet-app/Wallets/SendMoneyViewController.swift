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
    @IBOutlet weak var sendMoneyViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderSendMoneyView()
        // Do any additional setup after loading the view.
        cancelButton.addTarget(self, action: #selector(self.cancel), for: .touchUpInside)
    }
    
    func renderSendMoneyView() {
        sendMoneyViewContainer.layer.cornerRadius = 20
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
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
