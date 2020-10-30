//
//  SecondViewController.swift
//  iOSDevCampDC2020
//
//  Created by Stephen Shaw on 10/25/20.
//  Copyright © 2020 Stephen Shaw. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let homeLabel = UILabel()
        homeLabel.text = "Home"
        homeLabel.textColor = .black
        homeLabel.font = .systemFont(ofSize: 32.0)
        homeLabel.textAlignment = .center
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeLabel)
        homeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
        homeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        homeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0).isActive = true
        homeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
    }

}

