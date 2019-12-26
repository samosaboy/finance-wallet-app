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
    let image: String
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath as IndexPath) as! DataTableViewCell
        cell.title.text = "\(dataArray[indexPath.row].name)"
        cell.subtitle.text = "\(dataArray[indexPath.row].description)"
        cell.button.setTitle("+\(dataArray[indexPath.row].pointsAmount) Pts", for: .normal)
        cell.icon.image = UIImage(named: "\(dataArray[indexPath.row].image)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadData()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        tableView.isScrollEnabled = false
        
        self.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let customCell = UINib(nibName: "DataTableViewCell", bundle: nil)
        tableView.register(customCell, forCellReuseIdentifier: "DataCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
