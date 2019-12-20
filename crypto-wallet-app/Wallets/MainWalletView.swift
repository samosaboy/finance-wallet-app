//
//  MainWalletView.swift
//  crypto-wallet-app
//
//  Created by Hackintoshi9 on 2019-12-19.
//  Copyright © 2019 sam0sab0y. All rights reserved.
//

import UIKit

class MainWalletView: UIView {
    var edgeInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
    
    lazy var balanceText: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.text = "Total Balance"
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    lazy var balanceAmount: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: balanceText.frame.maxY + 5, width: 100, height: 100))
        label.backgroundColor = .clear
        label.textColor = .black
        label.text = "$5,039.53"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    
    lazy var balanceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.addSubview(balanceText)
        view.addSubview(balanceAmount)
        return view
    }()
    
    
    lazy var manageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Manage", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.sizeToFit()
        button.layer.cornerRadius = button.frame.size.height / 2.0
        return button
    }()
    
    
    lazy var sendMoneyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Send Money", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.sizeToFit()
        button.addTarget(WalletsViewController.sharedInstance!, action: #selector(WalletsViewController.showSendMoney(_:)), for: .touchUpInside)
//        button.addTarget(SendMoneyViewController.sharedInstance!, action: #selector(SendMoneyViewController.testAction(_:)), for: .touchUpInside)
        button.layer.cornerRadius = button.frame.size.height / 2.0
        return button
    }()
    
    
    lazy var buttonViewContainer: UIStackView = {
        let view = UIStackView(arrangedSubviews: [manageButton, sendMoneyButton])

        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        return view
    }()
    
    let mainContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.backgroundColor = .white
        return view
    }()
    
    func create(frame: CGRect) {
        self.addSubview(mainContainer)
        mainContainer.addSubview(balanceView)
        mainContainer.addSubview(buttonViewContainer)
        
        NSLayoutConstraint.activate([
            mainContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            mainContainer.topAnchor.constraint(equalTo: self.topAnchor),
            mainContainer.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])

        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: edgeInsets.top),
            balanceView.leftAnchor.constraint(equalTo: mainContainer.leftAnchor, constant: edgeInsets.leading),
            balanceView.rightAnchor.constraint(equalTo: mainContainer.rightAnchor, constant: -edgeInsets.trailing),
            balanceView.heightAnchor.constraint(equalToConstant: 50),
            
            buttonViewContainer.topAnchor.constraint(equalTo: balanceView.bottomAnchor),
            buttonViewContainer.leftAnchor.constraint(equalTo: balanceView.leftAnchor),
            buttonViewContainer.rightAnchor.constraint(equalTo: balanceView.rightAnchor),
        ])
        
//        sendMoneyButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.create(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.create(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainContainer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }

}
