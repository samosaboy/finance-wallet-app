//
//  WalletsViewController.swift
//  crypto-wallet-app
//
//  Created by Hackintoshi9 on 2019-12-18.
//  Copyright © 2019 sam0sab0y. All rights reserved.
//

import UIKit
import SwiftIcons

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
    
    let thisMonth: UIView = {
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
    
    lazy var smallTitleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize, weight: .semibold)
        label.text = "Dashboard"
        return label
    }()
    
    lazy var contactImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "contact-photo")
        view.contentMode = .center
        return view
    }()
    
    lazy var pageTitle: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        view.translatesAutoresizingMaskIntoConstraints = false
        let overviewText = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        overviewText.text = "Overview"
        overviewText.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: .regular)
        overviewText.textColor = .black
        overviewText.sizeToFit()
        
        let dashboardText = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        dashboardText.text = "Dashboard"
        dashboardText.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        dashboardText.textColor = .black
        dashboardText.sizeToFit()
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.addArrangedSubview(overviewText)
        stack.addArrangedSubview(dashboardText)
        view.addSubview(stack)
        return view
    }()
    
    lazy var rightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton()
        button.setIcon(icon: .ionicons(.androidNotificationsNone), iconSize: 32, color: .black, forState: .normal)
        button.sizeToFit()
        
        view.addSubview(button)
        view.addSubview(contactImage)
        
        contactImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: contactImage.rightAnchor, constant: -contactImage.frame.size.width - 10).isActive = true
        
        return view
    }()
    
    lazy var titleView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .bottom
        view.distribution = .fill
        view.addArrangedSubview(pageTitle)
        view.addArrangedSubview(rightView)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        pageTitle.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rightView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rightView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleView)
        
        pageTitle.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        rightView.topAnchor.constraint(equalTo: pageTitle.topAnchor, constant: 10).isActive = true
        
        return view
    }()
    
    lazy var thisMonthView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        
        let thisMonthText = UILabel()
        thisMonthText.text = "This Month"
        thisMonthText.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title2).pointSize, weight: .bold)
        
        let viewMoreText = UILabel()
        viewMoreText.text = "View More"
        viewMoreText.textColor = .lightGray
        viewMoreText.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: .semibold)
        
        view.addArrangedSubview(thisMonthText)
        view.addArrangedSubview(viewMoreText)
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
        
        scrollViewContainer.addArrangedSubview(thisMonthView)
        
        scrollViewContainer.addArrangedSubview(thisMonth)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let view = ThisMonthView(frame: CGRect(x: 0, y: 0, width: thisMonthView.frame.size.width, height: thisMonth.frame.size.height))
        thisMonth.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: thisMonth.leftAnchor),
            view.rightAnchor.constraint(equalTo: thisMonth.rightAnchor),
            view.topAnchor.constraint(equalTo: thisMonth.topAnchor),
            view.bottomAnchor.constraint(equalTo: thisMonth.bottomAnchor),

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
        
        let maxTitlePoint = CGPoint(x: headerView.bounds.minY, y: headerView.bounds.maxY)
        
        if maxTitlePoint.y < scrollView.contentOffset.y {
            self.navigationController?.navigationBar.layer.shadowOpacity = 0.1
            animate(1)
        } else {
            self.navigationController?.navigationBar.layer.shadowOpacity = 0
            animate(0)
        }
    }
}
