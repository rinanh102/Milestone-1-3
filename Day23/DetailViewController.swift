//
//  DetailViewController.swift
//  Day23
//
//  Created by henry on 25/02/2019.
//  Copyright © 2019 HenryNguyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedCountries : String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let flagImage = selectedCountries{
            imageView.image = UIImage(named: flagImage)
        }
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    @objc func shareTapped(){
        guard let  image = imageView.image?.jpegData(compressionQuality: 0.9) else {
            print("No image")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
