//
//  ViewController.swift
//  Day23
//
//  Created by henry on 25/02/2019.
//  Copyright © 2019 HenryNguyen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var flagArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
    
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png"){
                flagArray.append(item)
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flagCell", for: indexPath)
        if let str = flagArray[indexPath.row] as? String{
            cell.textLabel?.text = str.dropLast(7).uppercased()
        }
//        cell.textLabel?.text = flagArray[indexPath.row]
        cell.imageView?.image = UIImage(named: flagArray[indexPath.row])
        
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        cell.imageView?.layer.borderWidth = 1
    
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FlagDetail") as? DetailViewController{
        
        vc.selectedCountries = flagArray[indexPath.row]
        if let str = flagArray[indexPath.row] as? String{
            vc.title = str.dropLast(7).uppercased()
            }
        navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}

