//
//  LoadingViewController.swift
//  iOSDevCampDC2020
//
//  Created by Stephen Shaw on 10/25/20.
//  Copyright © 2020 Stephen Shaw. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingIndicator)
        loadingIndicator.heightAnchor.constraint(equalToConstant: 64.0).isActive = true
        loadingIndicator.widthAnchor.constraint(equalToConstant: 64.0).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.startAnimating()
    }
}
