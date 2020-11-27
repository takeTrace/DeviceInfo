//
//  ViewController.swift
//  DeviceInfo
//
//  Created by takeTrace on 11/25/2020.
//  Copyright (c) 2020 takeTrace. All rights reserved.
//

import UIKit
import DeviceInfo

class ViewController: UITableViewController {
    
    lazy var datas = DeviceInfo.allValueMap(emptyString: "null")
        .compactMap { (arg0) -> [String: String]? in
            let (key, value) = arg0
            return [key: "\(value)"]
        }.sorted { (a, b) -> Bool in
            return (a.first?.key ?? "0") < (b.first?.key ?? "0")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.description)
        tableView.rowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "support value count: \(datas.count)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.description)
            ?? UITableViewCell(style: .value1, reuseIdentifier: self.description)
        let data = datas[indexPath.row]
        cell.textLabel?.text = "\(indexPath.row + 1). " + (data.first?.key ?? "null")
        cell.detailTextLabel?.text = data.first?.value ?? "null"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = datas[indexPath.row]
        let alert = UIAlertController(title: data.first?.key, message: data.first?.value, preferredStyle: .alert)
        alert.addAction(.init(title: "ok", style: .default, handler: { (_) in
            self.dismiss(animated: true)
        }))
        
        present(alert, animated: true) {
            print("\(data.first?.key): \(data.first?.value)\nsimulator: \(DeviceInfo.isSimulator)")
        }
    }
}

