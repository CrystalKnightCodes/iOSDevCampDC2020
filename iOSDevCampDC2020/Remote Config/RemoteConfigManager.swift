//
//  RemoteConfigManager.swift
//  iOSDevCampDC2020
//
//  Created by Stephen Shaw on 10/25/20.
//  Copyright © 2020 Stephen Shaw. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig

public class RemoteConfigManager {
    
    // MARK: - Properties
    
    static let shared = RemoteConfigManager()
    
    var remoteConfig: RemoteConfig {
        let rc = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        rc.configSettings = settings
        rc.setDefaults(fromPlist: "RemoteConfigDefaults")
        return rc
    }
    
    // MARK: - Fetch
    
    func fetchCloudValues(completion: ((Bool) -> Void)? = nil) {
        remoteConfig.fetch(withExpirationDuration: 0) { (status, error) in
            if status == .success {
                RemoteConfig.remoteConfig().activate(completion: { (_, err) in
                    if error != nil {
                        completion?(false)
                    } else {
                        completion?(true)
                    }
                })
            } else {
                completion?(false)
            }
        }
    }
    
    // MARK: - Utility Helpers
    
    private func getString(param: RemoteConfigParam) -> String? {
        return remoteConfig.configValue(forKey: param.rawValue).stringValue
    }
    
    // MARK: - Custom Types
    
    func getMaintenance() -> RemoteConfigMaintenance? {
        guard let maintenanceJSONString = getString(param: .maintenance) else {
            return nil
        }
        
        let jsonData = Data(maintenanceJSONString.utf8)
        let decoder = JSONDecoder()
        
        do {
            let maintenance = try decoder.decode(RemoteConfigMaintenance.self, from: jsonData)
            return maintenance
        } catch {
            print("Error decoding maintenance...")
            return nil
        }
    }
    
    func getTabs() -> [RemoteConfigTab] {
        guard let tabsJSONString = getString(param: .tabs) else {
            return []
        }
        
        let jsonData = Data(tabsJSONString.utf8)
        let decoder = JSONDecoder()
        
        do {
            let tabs = try decoder.decode([RemoteConfigTab].self, from: jsonData)
            return tabs
        } catch {
            print("Error decoding tabs...")
            return []
        }
    }

}
