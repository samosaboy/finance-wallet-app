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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! DataCell
        cell.titleText = "\(dataArray[indexPath.row].name)"
        cell.descText = "\(dataArray[indexPath.row].description)"
        return cell
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        tableView.isScrollEnabled = false
        tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        self.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DataCell.self, forCellReuseIdentifier: "cell")
        
        loadData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
