//
//  SettingsViewController.swift
//  iOSDevCampDC2020
//
//  Created by Stephen Shaw on 10/25/20.
//  Copyright © 2020 Stephen Shaw. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let settingsLabel = UILabel()
        settingsLabel.text = "Settings"
        settingsLabel.textColor = .black
        settingsLabel.font = .systemFont(ofSize: 32.0)
        settingsLabel.textAlignment = .center
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsLabel)
        settingsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
        settingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        settingsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0).isActive = true
        settingsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
    }
}
