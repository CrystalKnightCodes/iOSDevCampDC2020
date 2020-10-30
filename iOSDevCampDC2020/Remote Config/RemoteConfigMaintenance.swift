//
//  RemoteConfigMaintenance.swift
//  iOSDevCampDC2020
//
//  Created by Stephen Shaw on 10/30/20.
//  Copyright © 2020 Stephen Shaw. All rights reserved.
//

import Foundation

struct RemoteConfigMaintenance: Codable {
    var title: String
    var message: String
    var enabled: Bool
}
