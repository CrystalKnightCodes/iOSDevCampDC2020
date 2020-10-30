//
//  GamesViewController.swift
//  iOSDevCampDC2020
//
//  Created by Stephen Shaw on 10/25/20.
//  Copyright © 2020 Stephen Shaw. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let gamesLabel = UILabel()
        gamesLabel.text = "Games"
        gamesLabel.textColor = .black
        gamesLabel.font = .systemFont(ofSize: 32.0)
        gamesLabel.textAlignment = .center
        gamesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gamesLabel)
        gamesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
        gamesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        gamesLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0).isActive = true
        gamesLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
    }
}
