//
//  ThisMonthView.swift
//  crypto-wallet-app
//
//  Created by Hackintoshi9 on 2019-12-25.
//  Copyright © 2019 sam0sab0y. All rights reserved.
//

import UIKit

struct LineData: Decodable {
    let name: String
    let description: String
    let pointsAmount: Int
}

class ThisMonthView: UIView, UITableViewDelegate, UITableViewDataSource {
    private var dataArray = [LineData]()
    
    func loadData() {
        // url, data and jsonData should not be nil
        if let url = Bundle.main.path(forResource: "thisMonth", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: url), options: .mappedIfSafe)
                let json = try JSONDecoder().decode(Array<LineData>.self, from: data)
                self.dataArray = json
            } catch {
                print(error)
            }
        }
    }
    
    var tableView = UITableView()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = "\(dataArray[indexPath.row].name)"
        cell?.textLabel?.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize, weight: .bold)
        cell?.detailTextLabel?.text = "\(dataArray[indexPath.row].description)"
        cell?.detailTextLabel?.numberOfLines = 0
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize, weight: .regular)
        cell?.detailTextLabel?.textColor = .gray
        
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0xEBFCF7)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(UIColor(rgb: 0x1FC496), for: .normal)
        button.setTitle("+\(dataArray[indexPath.row].pointsAmount) Pts", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.sizeToFit()
        button.layer.cornerRadius = button.frame.size.height / 2.0
        
        cell?.accessoryView = button
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        tableView.isScrollEnabled = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        self.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        loadData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
