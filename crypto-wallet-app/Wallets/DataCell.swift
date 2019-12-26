//
//  DataCell.swift
//  crypto-wallet-app
//
//  Created by Hackintoshi9 on 2019-12-25.
//  Copyright © 2019 sam0sab0y. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {
    var titleText: String?
    var descText: String?
    
    var titleView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .gray
        view.isScrollEnabled = false
        view.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var descriptionView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .lightGray
        view.isScrollEnabled = false
        view.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .subheadline).pointSize, weight: .regular)
        view.textColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stack = UIStackView(arrangedSubviews: [titleView, descriptionView])
        stack.sizeToFit()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 0
        self.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: self.leftAnchor),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.rightAnchor.constraint(equalTo: self.rightAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stack.heightAnchor.constraint(equalTo: self.heightAnchor),
            
//            titleView.leftAnchor.constraint(equalTo: stack.leftAnchor),
//            titleView.rightAnchor.constraint(equalTo: stack.rightAnchor),
//            titleView.topAnchor.constraint(equalTo: stack.topAnchor),
//            titleView.bottomAnchor.constraint(greaterThanOrEqualTo: stack.bottomAnchor),
//
//            descriptionView.leftAnchor.constraint(equalTo: titleView.leftAnchor),
//            descriptionView.rightAnchor.constraint(equalTo: titleView.rightAnchor),
//            descriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 0),
//            descriptionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("xd")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let titleText = titleText {
            titleView.text = titleText
        }
        
        if let descText = descText {
            descriptionView.text = descText
        }
    }
}
