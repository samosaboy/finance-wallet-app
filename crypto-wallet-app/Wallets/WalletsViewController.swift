//
//  WalletsViewController.swift
//  crypto-wallet-app
//
//  Created by Hackintoshi9 on 2019-12-18.
//  Copyright © 2019 sam0sab0y. All rights reserved.
//

import UIKit

class WalletsViewController: UIViewController, UIScrollViewDelegate {
    static var sharedInstance: WalletsViewController?

    var wallets: [WalletItem] = [WalletItem(name: "BTC", balance: 120.42)]
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let subWallet: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
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
    
    let subWallet2: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
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
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0xEBFCF7)
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setTitleColor(UIColor(rgb: 0x1FC496), for: .normal)
        button.setTitle("Points: 17,321", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.sizeToFit()
        button.layer.cornerRadius = button.frame.size.height / 2.0
        return button
    }()
    
    lazy var largeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize, weight: .heavy)
        label.text = "My Wallets"
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var smallTitleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize, weight: .semibold)
        label.text = "My Wallets"
        return label
    }()
    
    lazy var contactImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        view.backgroundColor = .clear
        view.image = UIImage(named: "contact-photo")
        return view
    }()
    
    lazy var contactView: UIView = {
        let view = UIView()
        view.addSubview(contactImage)
        return view
    }()
    
    lazy var titleView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [contactView, button])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainWalletView: MainWalletView = {
        let view = MainWalletView()
        return view
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.heightAnchor.constraint(equalToConstant: 45).isActive = true
        view.addSubview(titleView)
        
        contactImage.center = CGPoint(x: contactImage.bounds.width / 2, y: 0)
        
        titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WalletsViewController.sharedInstance = self
        
        // scroll view is the actual UIScrollView
        view.addSubview(scrollView)
        scrollView.delegate = self
        
        self.navigationItem.titleView = smallTitleLabel
        
        // scrollViewContainer is a UIStackView
        scrollView.addSubview(scrollViewContainer)
        
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.navigationController?.navigationBar.layer.shadowRadius = 8
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        
        scrollViewContainer.addArrangedSubview(headerView)
        scrollViewContainer.addArrangedSubview(mainWalletView)
        
        scrollViewContainer.addArrangedSubview(subWallet)
        scrollViewContainer.addArrangedSubview(subWallet2)
        
        NSLayoutConstraint.activate([
            mainWalletView.heightAnchor.constraint(equalToConstant: 150),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    

    
    @objc
    func showSendMoney(_ sender: Any) {
        let sendMoneyViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SendMoneyViewController") as! SendMoneyViewController
        
        sendMoneyViewController.modalPresentationStyle = .overFullScreen
        sendMoneyViewController.modalTransitionStyle = .crossDissolve
        sendMoneyViewController.modalPresentationCapturesStatusBarAppearance = true
        self.present(sendMoneyViewController, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        func animate(_ alpha: Int){
            UIView.animate(withDuration: 0.25, delay: 0, options: .transitionCrossDissolve, animations: {
                self.navigationItem.titleView?.alpha = CGFloat(alpha)
            })
        }
        
        let maxTitlePoint = CGPoint(x: titleView.bounds.minY, y: titleView.bounds.maxY)
        
        if maxTitlePoint.y < scrollView.contentOffset.y {
            self.navigationController?.navigationBar.layer.shadowOpacity = 0.1
            animate(1)
        } else {
            self.navigationController?.navigationBar.layer.shadowOpacity = 0
            animate(0)
        }
    }
}
