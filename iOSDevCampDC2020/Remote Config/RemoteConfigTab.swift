//
//  RemoteConfigTab.swift
//  iOSDevCampDC2020
//
//  Created by Stephen Shaw on 10/30/20.
//  Copyright © 2020 Stephen Shaw. All rights reserved.
//

import Foundation
import UIKit

struct RemoteConfigTab: Codable {
    var title: String
    var systemImageName: String
    
    private enum CodingKeys: String, CodingKey {
        case title, systemImageName
    }
    
    var image: UIImage? {
        return UIImage(systemName: systemImageName)
    }
    var viewController: UIViewController? {
        return RemoteConfigTabType(rawValue: title)?.viewController
    }
}

enum RemoteConfigTabType: String {
    case home = "Home"
    case games = "Games"
    case profile = "Profile"
    case settings = "Settings"
    
    var viewController: UIViewController? {
        switch self {
        case .home:
            return HomeViewController()
        case .games:
            return GamesViewController()
        case .settings:
            return SettingsViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}
