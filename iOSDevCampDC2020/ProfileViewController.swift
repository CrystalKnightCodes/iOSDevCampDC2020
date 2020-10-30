//
//  ProfileViewController.swift
//  iOSDevCampDC2020
//
//  Created by Stephen Shaw on 10/25/20.
//  Copyright © 2020 Stephen Shaw. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let profileLabel = UILabel()
        profileLabel.text = "Profile"
        profileLabel.textColor = .black
        profileLabel.font = .systemFont(ofSize: 32.0)
        profileLabel.textAlignment = .center
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileLabel)
        profileLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
        profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        profileLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0).isActive = true
        profileLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
    }
}
